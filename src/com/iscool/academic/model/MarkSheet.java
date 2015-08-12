package com.iscool.academic.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lenovo_pc
 * Date: 2/17/15
 * Time: 7:04 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name="MARK_SHEET")
public class MarkSheet {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String Books;

    private String Examination;

    private String Klass;

    @ManyToMany
    private List<MarksDistribution> marksDistributionList = new ArrayList<MarksDistribution>();


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBooks() {
        return Books;
    }

    public void setBooks(String books) {
        Books = books;
    }

    public String getExamination() {
        return Examination;
    }

    public void setExamination(String examination) {
        Examination = examination;
    }

    public String getKlass() {
        return Klass;
    }

    public void setKlass(String klass) {
        Klass = klass;
    }

    public List<MarksDistribution> getMarksDistributionList() {
        return marksDistributionList;
    }

    public void setMarksDistributionList(List<MarksDistribution> marksDistributionList) {
        this.marksDistributionList = marksDistributionList;
    }
}
