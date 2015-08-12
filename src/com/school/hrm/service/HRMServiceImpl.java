package com.school.hrm.service;

import com.school.hrm.dao.DepartmentDAO;
import com.school.hrm.dao.DesignationDAO;
import com.school.hrm.dao.UserDetailsDAO;
import com.school.hrm.model.Department;
import com.school.hrm.model.Designation;
import com.school.hrm.model.UserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HRMServiceImpl implements HRMService{
    @Autowired
    DepartmentDAO departmentDAO;
    @Autowired
    DesignationDAO designationDAO;
    @Autowired
    UserDetailsDAO userDetailsDAO;

    //User details
    @Override
    public boolean save(UserDetails userDetails) {
        return userDetailsDAO.save(userDetails);
    }

    @Override
    public boolean update(UserDetails userDetails) {
        return userDetailsDAO.update(userDetails);
    }

    @Override
    public boolean delete(UserDetails userDetails) {
        return userDetailsDAO.delete(userDetails);
    }

    @Override
    public List<UserDetails> findAllUserDetails() {
        return userDetailsDAO.findAllUserDetails();
    }

    @Override
    public UserDetails getUserDetails(Long id) {
        return userDetailsDAO.getUserDetails(id);
    }


    //Department
    @Override
    public boolean save(Department department) {
        return departmentDAO.save(department);
    }

    @Override
    public boolean update(Department department) {
        return departmentDAO.update(department);
    }

    @Override
    public boolean delete(Department department) {
        return departmentDAO.delete(department);
    }

    @Override
    public List<Department> findAllDepartment() {
        return departmentDAO.findAllDepartment();
    }

    @Override
    public Department getDepartment(Long id) {
        return departmentDAO.getDepartment(id);
    }

    //Designation
    @Override
    public boolean save(Designation designation) {
        return designationDAO.save(designation);
    }

    @Override
    public boolean update(Designation designation) {
        return designationDAO.update(designation);
    }

    @Override
    public boolean delete(Designation designation) {
        return designationDAO.delete(designation);
    }

    @Override
    public List<Designation> findAllDesignation() {
        return designationDAO.findAllDesignation();
    }

    @Override
    public Designation getDesignation(Long id) {
        return designationDAO.getDesignation(id);
    }

}
