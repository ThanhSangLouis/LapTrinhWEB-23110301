package vn.iotstar.configs.dao.implement;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.configs.dao.ICategoryDao;
import vn.iotstar.configs.model.Category;
import vn.iotstar.configs.DBConnect;

public class CategoryDaoImpl implements ICategoryDao {

    @Override
    public void insert(Category cate) {
        String sql = "INSERT INTO Category(name, icon) VALUES (?, ?)";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cate.getName());
            ps.setString(2, cate.getIcon());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Category cate) {
        String sql = "UPDATE Category SET name=?, icon=? WHERE id=?";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cate.getName());
            ps.setString(2, cate.getIcon());
            ps.setInt(3, cate.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM Category WHERE id=?";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Category findById(int id) {
        String sql = "SELECT * FROM Category WHERE id=?";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Category(rs.getInt("id"), rs.getString("name"), rs.getString("icon"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Category> findAll() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Category";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Category(rs.getInt("id"), rs.getString("name"), rs.getString("icon")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
