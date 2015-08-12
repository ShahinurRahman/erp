package com.iscool.academic.model;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: lenovo_pc
 * Date: 2/17/15
 * Time: 6:37 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name="MARKS_DISTRIBUTION")
public class MarksDistribution {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String Student;

    private String written;

    private String MCQ;

    private String practical;

    private String tutorial;

    private String classTest;

    private String quizeTest;

    private String others;

    private String MarksSheet;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStudent() {
        return Student;
    }

    public void setStudent(String student) {
        Student = student;
    }

    public String getWritten() {
        return written;
    }

    public void setWritten(String written) {
        this.written = written;
    }

    public String getMCQ() {
        return MCQ;
    }

    public void setMCQ(String MCQ) {
        this.MCQ = MCQ;
    }

    public String getPractical() {
        return practical;
    }

    public void setPractical(String practical) {
        this.practical = practical;
    }

    public String getTutorial() {
        return tutorial;
    }

    public void setTutorial(String tutorial) {
        this.tutorial = tutorial;
    }

    public String getClassTest() {
        return classTest;
    }

    public void setClassTest(String classTest) {
        this.classTest = classTest;
    }

    public String getQuizeTest() {
        return quizeTest;
    }

    public void setQuizeTest(String quizeTest) {
        this.quizeTest = quizeTest;
    }

    public String getOthers() {
        return others;
    }

    public void setOthers(String others) {
        this.others = others;
    }

    public String getMarksSheet() {
        return MarksSheet;
    }

    public void setMarksSheet(String marksSheet) {
        MarksSheet = marksSheet;
    }
}
