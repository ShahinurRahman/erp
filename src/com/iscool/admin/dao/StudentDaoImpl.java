package com.iscool.admin.dao;

import com.iscool.admin.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created with IntelliJ IDEA.
 * User: lenovo_pc
 * Date: 2/18/15
 * Time: 1:26 AM
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class StudentDaoImpl implements StudentDAO {
    @Autowired

    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Student student) {
        try {
            hibernateTemplate.persist(student);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Student student) {
        hibernateTemplate.merge(student);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Student student) {
        hibernateTemplate.delete(student);
        hibernateTemplate.flush();
        return true;
    }


}
