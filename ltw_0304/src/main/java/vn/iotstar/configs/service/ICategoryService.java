package vn.iotstar.configs.service;

import java.util.List;
import vn.iotstar.configs.model.Category;

public interface ICategoryService {
    void insert(Category cate);
    void update(Category cate);
    void delete(int id);
    Category findById(int id);
    List<Category> findAll();
}
