package dal;

import java.time.LocalDate;
import model.Account;
import model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import model.Category;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.Product;

public class OrderDAO extends DBContext {

    public void addOrder(Account u, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            // add vào bảng Order
            String sql = "INSERT [dbo].[Order] ([aid], [date], [totalMoney], [status]) Values (?,?,?,0)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getId());
            st.setString(2, date);
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();

            // lấy ra id order vừa add
            String sql1 = " select top 1 id from [Order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            // add vào bảng orderline
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = """
                                  INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) Values (?,?,?,?)
                                  Update [dbo].[product] set [quantity]=?,[sold]=?
                                  where [id]=?
                                  Update [dbo].[Account] set [amount]=?,[bought]=?
                                  where [id]=?""";

                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.setInt(5, i.getProduct().getQuantity() - i.getQuantity());
                    st2.setInt(6, i.getProduct().getSold() + i.getQuantity());
                    st2.setInt(7, i.getProduct().getId());
                    st2.setDouble(8, u.getAmount() - cart.getTotalMoney());
                    st2.setInt(9, u.getBought() + i.getQuantity());
                    st2.setInt(10, u.getId());
                    st2.executeUpdate();
                }
            }
        } catch (SQLException e) {
        }
    }

    public List<OrderDetail> getOrderDetailByAid(int aid, int index, String key, int sort) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = """
                                                SELECT ol.[quantity],
                                                 ol.[price],
                                                 o.id,                
                                                 o.[date],
                                                 o.[totalMoney],
                                                 o.[status],
                                                 a.[id],
                                                 a.[avatar],
                                                 a.[user],                                                 
                                                 a.[pass],
                                                 a.[email],
                                                 a.[phone],
                                                 a.[amount],
                                                 a.[bought],
                                                 a.[address],
                                                 a.[status],
                                                 a.[isAdmin],
                                                 p.[id],
                                                 p.[name],
                                                 p.[image],
                                                 p.[price],
                                                 p.[quantity],
                                                 p.[sold],
                                                 p.[releaseDate],
                                                 p.[description],
                                                 p.[rate],
                                                 c.[cid],
                                                 c.[cname]
                                                 FROM OrderLine ol
                                                 INNER JOIN [Order] o ON o.id = ol.oid
                                                 INNER JOIN [Account] a ON a.id = o.aid
                                                 INNER JOIN (Product p inner join Category c on c.cid=p.cateID) ON p.id = ol.pid
                                                 WHERE 1=1 """;
        if (aid != 0) {
            sql += " and o.[aid] = " + aid;
        }
        if (key != null && !key.equals("")) {
            sql += " and (p.[name] like '%" + key + "%')";
        }
        if (sort == 0) {
            sql += " \n order by o.[status], o.[id] desc, o.[date] desc";
        }
        if (sort == 1) {
            sql += "\n order by o.[id]";
        }
        if (sort == 2) {
            sql += "\n order by o.[id] desc";
        }
        if (sort == 3) {
            sql += "\n order by o.[date]";
        }
        if (sort == 4) {
            sql += "\n order by o.[date] desc";
        }
        if (sort == 5) {
            sql += "\n order by o.[totalMoney]";
        }
        if (sort == 6) {
            sql += "\n order by o.[totalMoney] desc";
        }
        if (index != 0) {
            sql += "\n OFFSET " + ((index - 1) * 5) + " ROWS FETCH NEXT 5 ROWS ONLY";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(
                        rs.getInt(1),
                        rs.getDouble(2),
                        new Order(
                                rs.getInt(3),
                                rs.getString(4),
                                rs.getDouble(5),
                                rs.getInt(6),
                                new Account(rs.getInt(7),
                                        rs.getString(8),
                                        rs.getString(9),
                                        rs.getString(10),
                                        rs.getString(11),
                                        rs.getString(12),
                                        rs.getDouble(13),
                                        rs.getInt(14),
                                        rs.getString(15),
                                        rs.getInt(16),
                                        rs.getInt(17))
                        ),
                        new Product(rs.getInt(18),
                                rs.getString(19),
                                rs.getString(20),
                                rs.getDouble(21),
                                rs.getInt(22),
                                rs.getInt(23),
                                rs.getDate(24),
                                rs.getString(25),
                                rs.getDouble(26),
                                new Category(rs.getInt(27),
                                        rs.getString(28)))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int countOrder(int aid, int index, String key, int sort) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = """
                                SELECT COUNT(*)
                                FROM OrderLine ol
                                INNER JOIN [Order] o ON o.id = ol.oid
                                INNER JOIN [Account] a ON a.id = o.aid
                                INNER JOIN (Product p inner join Category c on c.cid=p.cateID) ON p.id = ol.pid
                                WHERE 1=1 """;
        if (aid != 0) {
            sql += " and o.[aid] = " + aid;
        }
        if (key != null && !key.equals("")) {
            sql += " and (p.[name] like '%" + key + "%')";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int TotalMoney(int aid) {
        String sql = """
                     SELECT SUM(totalMoney) FROM [order]
                     where aid= ?   """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public double getTotalByYear(int year) {
        String sql = "select sum (totalMoney) from [Order] where year(date) = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public double getTotalByMonth(int month, int year) {
        String sql = "select sum (totalMoney) from [Order] where MONTH(date)=? and year(date) = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month);
            st.setInt(2, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public double getTotalPByMonth(int month, int year, String cid) {
        String sql = "select sum(o.[totalMoney])    \n"
                + "FROM OrderLine ol\n"
                + "INNER JOIN [Order] o ON o.id = ol.oid\n"
                + "INNER JOIN [Product] p ON p.id = ol.pid\n"
                + "where MONTH(o.[date])= ? and year(o.[date]) = ? and p.cateID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month);
            st.setInt(2, year);
            st.setString(3, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public void status(String id, String status) {
        String sql = """
                   Update [Order]
                   set [status]=?
                   where [id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setString(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteOrderByOid(int oid) {
        String sql = """
                   delete from [OrderLine]
                   where oid = ?
                   delete from [Order]
                   where [id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            st.setInt(2, oid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public OrderDetail getOrderById(int oid) {
        String sql = """
                                                SELECT ol.[quantity],
                                                 ol.[price],
                                                 o.id,                
                                                 o.[date],
                                                 o.[totalMoney],
                                                 o.[status],
                                                 a.[id],
                                                 a.[avatar],
                                                 a.[user],                                                 
                                                 a.[pass],
                                                 a.[email],
                                                 a.[phone],
                                                 a.[amount],
                                                 a.[bought],
                                                 a.[address],
                                                 a.[status],
                                                 a.[isAdmin],
                                                 p.[id],
                                                 p.[name],
                                                 p.[image],
                                                 p.[price],
                                                 p.[quantity],
                                                 p.[sold],
                                                 p.[releaseDate],
                                                 p.[description],
                                                 p.[rate],
                                                 c.[cid],
                                                 c.[cname]
                                                 FROM OrderLine ol
                                                 INNER JOIN [Order] o ON o.id = ol.oid
                                                 INNER JOIN [Account] a ON a.id = o.aid
                                                 INNER JOIN (Product p inner join Category c on c.cid=p.cateID) ON p.id = ol.pid
                                                 WHERE o.[id]=? """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new OrderDetail(
                        rs.getInt(1),
                        rs.getDouble(2),
                        new Order(
                                rs.getInt(3),
                                rs.getString(4),
                                rs.getDouble(5),
                                rs.getInt(6),
                                new Account(rs.getInt(7),
                                        rs.getString(8),
                                        rs.getString(9),
                                        rs.getString(10),
                                        rs.getString(11),
                                        rs.getString(12),
                                        rs.getDouble(13),
                                        rs.getInt(14),
                                        rs.getString(15),
                                        rs.getInt(16),
                                        rs.getInt(17))
                        ),
                        new Product(rs.getInt(18),
                                rs.getString(19),
                                rs.getString(20),
                                rs.getDouble(21),
                                rs.getInt(22),
                                rs.getInt(23),
                                rs.getDate(24),
                                rs.getString(25),
                                rs.getDouble(26),
                                new Category(rs.getInt(27),
                                        rs.getString(28))));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void editOrder(double quantity, double price, String oid, String date, String status,
            String phone, String email, String address, String aid, String pname, String pid) {
        try {
            // Update OrderLine
            String orderLineSQL = "UPDATE OrderLine SET quantity = ?, price = ? WHERE oid = ?";
            PreparedStatement orderLineStatement = connection.prepareStatement(orderLineSQL);
            orderLineStatement.setDouble(1, quantity);
            orderLineStatement.setDouble(2, price);
            orderLineStatement.setString(3, oid);
            orderLineStatement.executeUpdate();

            // Update Order
            String orderSQL = "UPDATE [Order] SET date = ?, status = ?, totalMoney = (SELECT SUM(quantity * price) FROM OrderLine WHERE oid = ?) WHERE id = ?";
            PreparedStatement orderStatement = connection.prepareStatement(orderSQL);
            orderStatement.setString(1, date);
            orderStatement.setString(2, status);
            orderStatement.setString(3, oid);
            orderStatement.setString(4, oid);
            orderStatement.executeUpdate();

            // Update Account
            String accountSQL = "UPDATE Account SET phone = ?, email = ?, Address = ? WHERE id = ?";
            PreparedStatement accountStatement = connection.prepareStatement(accountSQL);
            accountStatement.setString(1, phone);
            accountStatement.setString(2, email);
            accountStatement.setString(3, address);
            accountStatement.setString(4, aid);
            accountStatement.executeUpdate();

            // Update Product
            String productSQL = "UPDATE product SET name = ? WHERE id = ?";
            PreparedStatement productStatement = connection.prepareStatement(productSQL);
            productStatement.setString(1, pname);
            productStatement.setString(2, pid);
            productStatement.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        OrderDAO odao = new OrderDAO();
        odao.editOrder(4, 70, "8", "2023-05-12", "0", "0123456789", "admin2@gmail.com", "Son La", "3", "Giày Thể Thao Adidas Run Falcon 2.0", "6");
    }
}
