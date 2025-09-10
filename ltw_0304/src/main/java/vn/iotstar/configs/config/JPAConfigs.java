package vn.iotstar.configs.config;

import jakarta.persistence.EntityManager;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import vn.iotstar.configs.entity.Category;

public class JPAConfigs {

    private static final EntityManagerFactory factory =
            Persistence.createEntityManagerFactory("dataSource"); // tên persistence-unit trong persistence.xml

    public static EntityManager getEntityManager() {
        return factory.createEntityManager();
    }

    public static void main(String[] args) {
        EntityManager enma = getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        Category cate = new Category();
        cate.setName("Iphone");
        cate.setImages("abc.jpg");

        try {
            trans.begin();
            enma.persist(cate);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (trans.isActive()) {
                trans.rollback();
            }
        } finally {
            enma.close();
            factory.close(); // đóng factory khi kết thúc chương trình
        }
    }
}
