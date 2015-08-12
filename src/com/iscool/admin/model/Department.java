package com.iscool.admin.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lenovo_pc
 * Date: 2/17/15
 * Time: 5:33 PM
 * To change this template use File | Settings | File Templates.
 */

@Entity
@Table(name="DEPARTMENT")
public class Department implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private String description;

    @OneToMany
    private List<Teacher> teachersList = new ArrayList<Teacher>();



}
