package vn.iotstar.configs.dao;

import java.util.List;
import vn.iotstar.configs.model.Category;

public interface ICategoryDao {
    void insert(Category cate);
    void update(Category cate);
    void delete(int id);
    Category findById(int id);
    List<Category> findAll();
}
