package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Category;
import model.Product;

public class DAO extends DBContext {

    public List<Product> getAllProduct(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.[id]\n"
                + "                       ,p.[name]\n"
                + "                       ,p.[image]\n"
                + "                       ,p.[price]\n"
                + "                       ,p.[quantity]\n"
                + "                       ,p.[sold]\n"
                + "                       ,p.[releaseDate]\n"
                + "                       ,p.[description]\n"
                + "                       ,p.[rate]\n"
                + "                       ,c.[cid]\n"
                + "                       ,c.[cname]\n"
                + "                       from product p inner join category c on (c.cid=p.cateID)"
                + "                       where 1=1 \n  "
                + "                       ORDER BY p.[id]";

        if (index != 0) {
            sql += "\n OFFSET " + ((index - 1) * 5) + " ROWS FETCH NEXT 5 ROWS ONLY";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int countAllProduct() {
        String sql = """
                    SELECT COUNT(*) 
                    from product p inner join category c on (c.cid=p.cateID)
                    where 1=1""";
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

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Product getLast() {
        String sql = """
                       select top 1 p.[id]
                       ,p.[name]
                       ,p.[image]
                       ,p.[price]
                       ,p.[quantity]
                       ,p.[sold]
                       ,p.[releaseDate]
                       ,p.[description]
                       ,p.[rate]
                       ,c.[cid]
                       ,c.[cname]
                       from product p inner join category c on (c.cid=p.cateID)                                  
                       order by releaseDate desc""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11)));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Product> listProductByPid(String pid) {
        List<Product> list = new ArrayList<>();
        String sql = """
                        select top 4 p.[id]
                        ,p.[name]
                        ,p.[image]
                        ,p.[price]
                        ,p.[quantity]
                        ,p.[sold]
                        ,p.[releaseDate]
                        ,p.[description]
                        ,p.[rate]
                        ,c.[cid]
                        ,c.[cname]
                        from product p inner join category c on (c.cid=p.cateID)
                        where cateID = (select (cateID) from Product where id = ? ) AND p.[id] <> ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.setString(2, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> listProductLast() {
        List<Product> list = new ArrayList<>();
        String sql = """
                        select top 3 p.[id]
                        ,p.[name]
                        ,p.[image]
                        ,p.[price]
                        ,p.[quantity]
                        ,p.[sold]
                        ,p.[releaseDate]
                        ,p.[description]
                        ,p.[rate]
                        ,c.[cid]
                        ,c.[cname]
                        from product p inner join category c on (c.cid=p.cateID)
                        order by releaseDate desc""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> listProductBySold2() {
        List<Product> list = new ArrayList<>();
        String sql = """
                       select top 3 p.[id]
                                    ,p.[name]
                                    ,p.[image]
                                    ,p.[price]
                                    ,p.[quantity]
                                    ,p.[sold]
                                    ,p.[releaseDate]
                                    ,p.[description]
                                    ,p.[rate]
                                    ,c.[cid]
                                    ,c.[cname]
                                    from product p inner join category c on (c.cid=p.cateID)
                                    order by sold""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> listProductBySold() {
        List<Product> list = new ArrayList<>();
        String sql = """
                       select top 3 p.[id]
                       ,p.[name]
                       ,p.[image]
                       ,p.[price]
                       ,p.[quantity]
                       ,p.[sold]
                       ,p.[releaseDate]
                       ,p.[description]
                       ,p.[rate]
                       ,c.[cid]
                       ,c.[cname]
                       from product p inner join category c on (c.cid=p.cateID)
                       order by sold desc""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> listProductByPrice() {
        List<Product> list = new ArrayList<>();
        String sql = """
                       select top 3 p.[id]
                       ,p.[name]
                       ,p.[image]
                       ,p.[price]
                       ,p.[quantity]
                       ,p.[sold]
                       ,p.[releaseDate]
                       ,p.[description]
                       ,p.[rate]
                       ,c.[cid]
                       ,c.[cname]
                       from product p inner join category c on (c.cid=p.cateID)
                       order by price""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> search(int[] cid, String key, Double fromprice, Double toprice, Date fromdate, Date todate, int sort, int index) {
        List<Product> list = new ArrayList<>();
        String sql = """
                       select p.[id]
                       ,p.[name]
                       ,p.[image]
                       ,p.[price]
                       ,p.[quantity]
                       ,p.[sold]
                       ,p.[releaseDate]
                       ,p.[description]
                       ,p.[rate]
                       ,c.[cid]
                       ,c.[cname]
                       from product p inner join category c on (c.cid=p.cateID)
                       where 1=1""";

        if (cid != null && cid[0] != 0) {
            sql += " and p.[cateID] in (";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (key != null && !key.equals("")) {
            sql += " and (p.[name] like '%" + key + "%')";
        }
        if (fromdate != null) {
            sql += " and p.[releaseDate] >='" + fromdate + "'";
        }
        if (todate != null) {
            sql += " and p.[releaseDate] <='" + todate + "'";
        }
        if (fromprice != null) {
            sql += " and p.[price] >=" + fromprice;
        }
        if (toprice != null) {
            sql += " and p.[price] <=" + toprice;
        }
        if (sort == 0) {
            sql += " \n order by p.[id]";
        }
        if (sort == 1) {
            sql += "\n order by p.[price]";
        }
        if (sort == 2) {
            sql += "\n order by p.[price] desc";
        }
        if (sort == 3) {
            sql += "\n order by p.[rate]";
        }
        if (sort == 4) {
            sql += "\n order by p.[rate] desc";
        }
        if (sort == 5) {
            sql += "\n order by p.[sold]";
        }
        if (sort == 6) {
            sql += "\n order by p.[sold] desc";
        }
        sql += "\nOFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 9);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int countSearchProduct(int[] cid, String key, Double fromprice, Double toprice, Date fromdate, Date todate) {
        String sql = """
                    SELECT COUNT(*) 
                    from product p inner join category c on (c.cid=p.cateID)
                    where 1=1""";
        if (cid != null && cid[0] != 0) {
            sql += " and p.[cateID] in (";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        if (key != null && !key.equals("")) {
            sql += " and (p.[name] like '%" + key + "%')";
        }
        if (fromdate != null) {
            sql += " and p.[releaseDate] >='" + fromdate + "'";
        }
        if (todate != null) {
            sql += " and p.[releaseDate] <='" + todate + "'";
        }
        if (fromprice != null) {
            sql += " and p.[price] >=" + fromprice;
        }
        if (toprice != null) {
            sql += " and p.[price] <=" + toprice;
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

    public Product getProductByID(String id) {
        String sql = """
                       select p.[id]
                       ,p.[name]
                       ,p.[image]
                       ,p.[price]
                       ,p.[quantity]
                       ,p.[sold]
                       ,p.[releaseDate]
                       ,p.[description]
                       ,p.[rate]
                       ,c.[cid]
                       ,c.[cname]
                       from product p inner join category c on (c.cid=p.cateID)
                       where id = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11)));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Account getAccountByUser(String user) {
        String sql = """
                       select * from account
                       where [user] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Account> pagingAccount(int index) {
        List<Account> list = new ArrayList<>();
        String sql = """
                       SELECT * FROM Account
                       ORDER BY [isAdmin] DESC, [user]
                       OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 5);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int countAccount() {
        String sql = "SELECT COUNT(*) AS count_account FROM Account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("count_account");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int countAccount1() {
        String sql = """
                     SELECT COUNT(*) AS count_account FROM Account
                                          where isAdmin = 1""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("count_account");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int countAccount2() {
        String sql = """
                     SELECT COUNT(*) AS count_account FROM Account
                     where isAdmin = 0""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("count_account");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int TotalPrice() {
        String sql = "SELECT SUM(price*sold) FROM product";
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

    public int AveragePrice() {
        String sql = "SELECT AVG(price) FROM product";
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

    public int TotalSold() {
        String sql = "SELECT SUM(sold) FROM product";
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

    public int getSumByCid(String cid) {
        String sql = """
                     select sum(sold) from product 
                     where cateID=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public Account getUserMax() {
        String sql = """
                       select * from account
                       where bought=(select Max(bought) from account)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Product getMax() {
        String sql = """
                       select p.[id]
                       ,p.[name]
                       ,p.[image]
                       ,p.[price]
                       ,p.[quantity]
                       ,p.[sold]
                       ,p.[releaseDate]
                       ,p.[description]
                       ,p.[rate]
                       ,c.[cid]
                       ,c.[cname]
                       from product p inner join category c on (c.cid=p.cateID)                                  
                       WHERE sold = (SELECT MAX(sold) FROM product)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11)));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Product getMin() {
        String sql = """
                       select p.[id]
                       ,p.[name]
                       ,p.[image]
                       ,p.[price]
                       ,p.[quantity]
                       ,p.[sold]
                       ,p.[releaseDate]
                       ,p.[description]
                       ,p.[rate]
                       ,c.[cid]
                       ,c.[cname]
                       from product p inner join category c on (c.cid=p.cateID)                                  
                       WHERE sold = (SELECT Min(sold) FROM product)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        new Category(rs.getInt(10),
                                rs.getString(11)));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Account login(String user, String pass) {
        String sql = """
                    SELECT *
                    FROM Account 
                    WHERE id IS NOT NULL 
                    AND id NOT IN (
                        SELECT a.id 
                        FROM Account a 
                        INNER JOIN Block b ON (b.aid = a.id)
                    ) and [user]=? and pass = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Account checkAccountExist(String user) {
        String sql = """
                       select * from account
                       where [user]=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void register(String user, String pass, String email, String phone, String address) {
        String sql = """
                  INSERT [dbo].[Account] ([user], [pass],[email] ,[phone], [amount], [bought], [Address], [isAdmin])
                  values(?,?,?,?,0,0,?,0)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.setString(3, email);
            st.setString(4, phone);
            st.setString(5, address);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Account forgotAccount(String user, String email) {
        String sql = """
                       select * from account
                       where [user]=? and [email] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void block(String aid) {
        String sql = "INSERT INTO [dbo].[Block]([aid]) VALUES (?)\n"
                + "update Account set [status] = 1 where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, aid);
            st.setString(2, aid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void active(String aid) {
        String sql = "delete from [block] where aid = ?\n"
                + "update Account set [status] = 0 where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, aid);
            st.setString(2, aid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteProduct(int pid) {
        String sql = """
                   delete from [comment] where pid = ?
                   delete from [product] where id = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, pid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteAccount(String aid, String user) {
        String sql = """
                   delete from [comment] where aid = ?
                   delete from Account
                   where [user] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, aid);
            st.setString(2, user);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addProduct(String name, String releaseDate, String description, String quantity, String sold, String image, String price, String rate, String category) {
        String sql = """
                   INSERT INTO [dbo].[product]([name],[image],[price],[quantity],[sold],[releaseDate],[description],[rate],[cateID])
                        VALUES(?,?,?,?,?,?,?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, price);
            st.setString(4, quantity);
            st.setString(5, sold);
            st.setString(6, releaseDate);
            st.setString(7, description);
            st.setString(8, rate);
            st.setString(9, category);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addAccount(String avatar, String user, String pass, String email, String phone, double amount, String bought, String address, String isAdmin) {
        String sql = """
                     INSERT INTO [dbo].[Account]([avatar],[user],[pass],[email],[phone],[amount],[bought],[Address],[status],[isAdmin])
                     VALUES(?,?,?,?,?,?,?,?,0,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, avatar);
            st.setString(2, user);
            st.setString(3, pass);
            st.setString(4, email);
            st.setString(5, phone);
            st.setDouble(6, amount);
            st.setString(7, bought);
            st.setString(8, address);
            st.setString(9, isAdmin);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void editProduct(String id, String name, String sold, String quantity, String releaseDate, String description, String image, String price, String rate, String category) {
        String sql = """
                   Update product
                   set [name]=?
                   ,[image]=?
                   ,[price]=?
                   ,[quantity]=?
                   ,[sold]=?
                   ,[releaseDate]=?
                   ,[description]=?
                   ,[rate]=?  
                   ,[cateID]=?
                   where [id]=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, price);
            st.setString(4, quantity);
            st.setString(5, sold);
            st.setString(6, releaseDate);
            st.setString(7, description);
            st.setString(8, rate);
            st.setString(9, category);
            st.setString(10, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void editAccount(String avatar, String user, String pass, String email, String phone, double amount, String bought, String address, String status, String isAdmin) {
        String sql = """
                   Update Account
                   set [avatar] = ?
                    ,[pass]=?
                    ,[email]=?
                    ,[phone]=?
                    ,[amount]=?
                    ,[bought]=?                    
                    ,[address]=?
                    ,[status]=?
                    ,[isAdmin]=?
                   where [user]=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, avatar);
            st.setString(2, pass);
            st.setString(3, email);
            st.setString(4, phone);
            st.setDouble(5, amount);
            st.setString(6, bought);
            st.setString(7, address);
            st.setString(8, status);
            st.setString(9, isAdmin);
            st.setString(10, user);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void changeAvatar(String avatar, String user) {
        String sql = """
                   Update Account
                   set [avatar]=?
                   where [user]=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, avatar);
            st.setString(2, user);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void changepass(String user, String pass) {
        String sql = """
                   Update Account
                   set [pass]=?
                   where [user]=?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, user);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Account> getTopTN() {
        List<Account> list = new ArrayList<>();
        String sql = """
                       SELECT TOP 3 *
                       FROM [Account] 
                       order by bought desc""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

}
