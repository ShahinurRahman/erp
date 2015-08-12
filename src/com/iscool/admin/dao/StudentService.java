package com.iscool.admin.dao;

import com.iscool.admin.model.Student;

/**
 * Created with IntelliJ IDEA.
 * User: lenovo_pc
 * Date: 2/18/15
 * Time: 2:08 AM
 * To change this template use File | Settings | File Templates.
 */
public interface StudentService {

    public boolean save(Student student);

    public boolean update(Student student);

    public boolean delete(Student student);
}
