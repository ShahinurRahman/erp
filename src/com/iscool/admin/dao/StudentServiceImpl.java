package com.iscool.admin.dao;

import com.iscool.admin.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created with IntelliJ IDEA.
 * User: lenovo_pc
 * Date: 2/18/15
 * Time: 2:08 AM
 * To change this template use File | Settings | File Templates.
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentDAO studentDAO;

    public boolean save(Student student){
        return StudentDAO.save(student);
    }
}
