
package com.ecom.shop.dao;

import com.ecom.shop.entities.Category;
import com.ecom.shop.entities.Product;
import com.ecom.shop.entities.User;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class Userdao {
     private SessionFactory factory;

     public Userdao(){     
     }
     
    public Userdao(SessionFactory factory) {
        this.factory = factory;
    }
     
     //get user by email and password
    
    public User getUserByEmailPassword(String email,String password)
    {
        User user= null;
        
        try{
            String query="from User where user_Email =:e and user_Password =:p";
            Session session= this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            
            user= (User)q.uniqueResult();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean updateUser(User user) {
        boolean b= false;
        Transaction tx = null;
        try (Session session = factory.openSession()) {
            tx = session.beginTransaction();
            session.update(user); // Update the user entity
            tx.commit();
            b=true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback(); // Rollback the transaction in case of an error
            }
            e.printStackTrace();
        }
        return b;
    }
    
    public boolean deleteUser(int userId){
        boolean b= false;
        Transaction tx= null;
       try (Session session = factory.openSession()) {
            tx = session.beginTransaction();
            User user = session.get(User.class, userId);
            session.delete(user); //deleting the user
            tx.commit();
            b=true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback(); // Rollback the transaction in case of an error
            }
            e.printStackTrace();
        }
        
        return b;
    }
    
    public User getUserById(int userId){
         User user = null;
        try (Session session = factory.openSession()) {
            user = session.get(User.class, userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public List<User> getAllUser()
    {
        try(Session session= this.factory.openSession();)
        {
            Transaction transaction = session.beginTransaction();
            Query query= session.createQuery("FROM User");
            List<User> users= query.list();
            return users;
        }
        
    }
    
    public List<Category> getAllCategory()
    {
        try(Session session= this.factory.openSession();)
        {
            Transaction transaction = session.beginTransaction();
            Query query= session.createQuery("FROM Category");
            List<Category> cat= query.list();
            return cat;
        }
    }
    
    public Category getCategoryById(int catid){
         Category cat = null;
        try (Session session = factory.openSession()) {
            cat = session.get(Category.class, catid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
    
    public boolean addCategory(Category cat) 
    {
        Transaction transaction = null;
        boolean success = false;

        try(Session session = factory.openSession())
        {
            transaction = session.beginTransaction();
            session.save(cat);

            // Commit the transaction
            transaction.commit();

            success = true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }

        return success;
    }
    
    public boolean deleteCategory(int catId){
        boolean b= false;
        Transaction tx= null;
       try (Session session = factory.openSession()) {
            tx = session.beginTransaction();
            Category cat = session.get(Category.class, catId);
            session.delete(cat); //deleting the user
            tx.commit();
            b=true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback(); // Rollback the transaction in case of an error
            }
            e.printStackTrace();
        }
        
        return b;
    }
    
    public boolean saveProduct(Product product){
        boolean b= false;
        Transaction tx = null;
        try (Session session = factory.openSession()) {
            tx = session.beginTransaction();
            session.save(product); // Update the user entity
            tx.commit();
            session.close();
            b=true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback(); // Rollback the transaction in case of an error
            }
            e.printStackTrace();
        }
        return b;
    }
    
    public List<Product> getAllProduct()
    {
        try(Session session= this.factory.openSession();)
        {
            Transaction transaction = session.beginTransaction();
            Query query= session.createQuery("FROM Product");
            List<Product> product= query.list();
            return product;
        }
    }
    
}