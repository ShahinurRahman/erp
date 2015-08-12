package com.school.hrm.dao;

import com.school.hrm.model.UserDetails;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface UserDetailsDAO {
    public boolean save(UserDetails userDetails);

    public boolean update(UserDetails userDetails);

    public boolean delete(UserDetails userDetails);

    public List<UserDetails> findAllUserDetails();

    public UserDetails getUserDetails(Long id);

}
