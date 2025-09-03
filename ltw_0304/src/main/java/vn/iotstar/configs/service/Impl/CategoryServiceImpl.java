package vn.iotstar.configs.service.Impl;

import java.util.List;

import vn.iotstar.configs.dao.ICategoryDao;
import vn.iotstar.configs.dao.implement.CategoryDaoImpl;
import vn.iotstar.configs.model.Category;
import vn.iotstar.configs.service.ICategoryService;

public class CategoryServiceImpl implements ICategoryService {
    ICategoryDao cateDao = new CategoryDaoImpl();

    @Override
    public void insert(Category cate) {
        cateDao.insert(cate);
    }

    @Override
    public void update(Category cate) {
        cateDao.update(cate);
    }

    @Override
    public void delete(int id) {
        cateDao.delete(id);
    }

    @Override
    public Category findById(int id) {
        return cateDao.findById(id);
    }

    @Override
    public List<Category> findAll() {
        return cateDao.findAll();
    }
}
