package com.iscool.academic.model;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: lenovo_pc
 * Date: 2/17/15
 * Time: 7:01 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name="AC_EXAM_METHOD")
public class ExamMethod {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String methodName;

    private String description;

}
