package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Comment;
import model.Product;

public class CommentDAO extends DBContext {

    public void AddComment(int aid, int pid, String content, int voted) {
        String sql = """
                     INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted])
                     VALUES(?,?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            st.setInt(2, pid);
            st.setString(3, content);
            st.setInt(4, voted);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Comment> displayComment(String pid, int index) {
        List<Comment> list = new ArrayList<>();
        String sql = """
                        SELECT c.[id],
                        c.[content],
                        c.[voted],
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
                        ca.[cid],
                        ca.[cname]
                        FROM [Comment] c  
                        INNER JOIN [Account] a ON (a.[id] = c.[aid])
                        INNER JOIN (Product p inner join Category ca on ca.[cid]=p.[cateID]) ON (p.[id] = c.[pid])
                        where p.[id] = ?
                        order by c.[id] desc
                        OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.setInt(2, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        new Account(rs.getInt(4),
                                rs.getString(5),
                                rs.getString(6),
                                rs.getString(7),
                                rs.getString(8),
                                rs.getString(9),
                                rs.getDouble(10),
                                rs.getInt(11),
                                rs.getString(12),
                                rs.getInt(13),
                                rs.getInt(14)),
                        new Product(rs.getInt(15),
                                rs.getString(16),
                                rs.getString(17),
                                rs.getDouble(18),
                                rs.getInt(19),
                                rs.getInt(20),
                                rs.getDate(21),
                                rs.getString(22),
                                rs.getDouble(23),
                                new Category(rs.getInt(24),
                                        rs.getString(25)))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Comment> getAllCommnet(String pid, String aid) {
        List<Comment> list = new ArrayList<>();
        String sql = """
                        SELECT c.[id],
                        c.[content],
                        c.[voted],
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
                        ca.[cid],
                        ca.[cname]
                        FROM [Comment] c  
                        INNER JOIN [Account] a ON (a.[id] = c.[aid])
                        INNER JOIN (Product p inner join Category ca on ca.[cid]=p.[cateID]) ON (p.[id] = c.[pid])
                        where p.[id] = ? and a.[id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.setString(2, aid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        new Account(rs.getInt(4),
                                rs.getString(5),
                                rs.getString(6),
                                rs.getString(7),
                                rs.getString(8),
                                rs.getString(9),
                                rs.getDouble(10),
                                rs.getInt(11),
                                rs.getString(12),
                                rs.getInt(13),
                                rs.getInt(14)),
                        new Product(rs.getInt(15),
                                rs.getString(16),
                                rs.getString(17),
                                rs.getDouble(18),
                                rs.getInt(19),
                                rs.getInt(20),
                                rs.getDate(21),
                                rs.getString(22),
                                rs.getDouble(23),
                                new Category(rs.getInt(24),
                                        rs.getString(25)))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int countCommentByPid(String pid) {
        String sql = """
                     SELECT COUNT(*) FROM Comment 
                     where pid = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public Comment getCommnetByID(String id) {
        String sql = """
                        SELECT c.[id],
                        c.[content],
                        c.[voted],
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
                        ca.[cid],
                        ca.[cname]
                        FROM [Comment] c  
                        INNER JOIN [Account] a ON (a.[id] = c.[aid])
                        INNER JOIN (Product p inner join Category ca on ca.[cid]=p.[cateID]) ON (p.[id] = c.[pid])
                        where c.[id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Comment(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        new Account(rs.getInt(4),
                                rs.getString(5),
                                rs.getString(6),
                                rs.getString(7),
                                rs.getString(8),
                                rs.getString(9),
                                rs.getDouble(10),
                                rs.getInt(11),
                                rs.getString(12),
                                rs.getInt(13),
                                rs.getInt(14)),
                        new Product(rs.getInt(15),
                                rs.getString(16),
                                rs.getString(17),
                                rs.getDouble(18),
                                rs.getInt(19),
                                rs.getInt(20),
                                rs.getDate(21),
                                rs.getString(22),
                                rs.getDouble(23),
                                new Category(rs.getInt(24),
                                        rs.getString(25))));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void edit(String voted, String content, String id) {
        String sql = "update [Comment] \n"
                + "set [voted] = ?,\n"
                + "[content] = ?\n"
                + "where [id]=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, voted);
            st.setString(2, content);
            st.setString(3, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        CommentDAO cdao = new CommentDAO();
        List<Comment> listC = cdao.displayComment("6", 0);
        for (Comment comment : listC) {
            System.out.println(comment);
        }
    }

    public void deleteComment(String id) {
        String sql = "delete from [comment] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

}
