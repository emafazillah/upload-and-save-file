/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author EMA
 */
@Entity
@Table(name = "testcasetxn2")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Testcasetxn2.findAll", query = "SELECT t FROM Testcasetxn2 t"),
    @NamedQuery(name = "Testcasetxn2.findById", query = "SELECT t FROM Testcasetxn2 t WHERE t.id = :id"),
    @NamedQuery(name = "Testcasetxn2.findByTestedFunction", query = "SELECT t FROM Testcasetxn2 t WHERE t.testedFunction = :testedFunction"),
    @NamedQuery(name = "Testcasetxn2.findByFunctionInput", query = "SELECT t FROM Testcasetxn2 t WHERE t.functionInput = :functionInput"),
    @NamedQuery(name = "Testcasetxn2.findByFunctionExpectedOutput", query = "SELECT t FROM Testcasetxn2 t WHERE t.functionExpectedOutput = :functionExpectedOutput"),
    @NamedQuery(name = "Testcasetxn2.findByWeightage", query = "SELECT t FROM Testcasetxn2 t WHERE t.weightage = :weightage"),
    @NamedQuery(name = "Testcasetxn2.findByWeightage3", query = "SELECT t FROM Testcasetxn2 t WHERE t.weightage3 = :weightage3"),
    @NamedQuery(name = "Testcasetxn2.findByWeightage2", query = "SELECT t FROM Testcasetxn2 t WHERE t.weightage2 = :weightage2"),
    @NamedQuery(name = "Testcasetxn2.findByWeightage1", query = "SELECT t FROM Testcasetxn2 t WHERE t.weightage1 = :weightage1"),
    @NamedQuery(name = "Testcasetxn2.findByFunctionStatus", query = "SELECT t FROM Testcasetxn2 t WHERE t.functionStatus = :functionStatus")})
public class Testcasetxn2 implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Size(max = 1000)
    @Column(name = "tested_function")
    private String testedFunction;
    @Size(max = 1000)
    @Column(name = "function_input")
    private String functionInput;
    @Size(max = 1000)
    @Column(name = "function_expected_output")
    private String functionExpectedOutput;
    @Column(name = "weightage")
    private Integer weightage;
    @Size(max = 10)
    @Column(name = "weightage3")
    private String weightage3;
    @Size(max = 10)
    @Column(name = "weightage2")
    private String weightage2;
    @Size(max = 10)
    @Column(name = "weightage1")
    private String weightage1;
    @Size(max = 10)
    @Column(name = "function_status")
    private String functionStatus;

    public Testcasetxn2() {
    }

    public Testcasetxn2(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTestedFunction() {
        return testedFunction;
    }

    public void setTestedFunction(String testedFunction) {
        this.testedFunction = testedFunction;
    }

    public String getFunctionInput() {
        return functionInput;
    }

    public void setFunctionInput(String functionInput) {
        this.functionInput = functionInput;
    }

    public String getFunctionExpectedOutput() {
        return functionExpectedOutput;
    }

    public void setFunctionExpectedOutput(String functionExpectedOutput) {
        this.functionExpectedOutput = functionExpectedOutput;
    }

    public Integer getWeightage() {
        return weightage;
    }

    public void setWeightage(Integer weightage) {
        this.weightage = weightage;
    }

    public String getWeightage3() {
        return weightage3;
    }

    public void setWeightage3(String weightage3) {
        this.weightage3 = weightage3;
    }

    public String getWeightage2() {
        return weightage2;
    }

    public void setWeightage2(String weightage2) {
        this.weightage2 = weightage2;
    }

    public String getWeightage1() {
        return weightage1;
    }

    public void setWeightage1(String weightage1) {
        this.weightage1 = weightage1;
    }

    public String getFunctionStatus() {
        return functionStatus;
    }

    public void setFunctionStatus(String functionStatus) {
        this.functionStatus = functionStatus;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Testcasetxn2)) {
            return false;
        }
        Testcasetxn2 other = (Testcasetxn2) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Testcasetxn2[ id=" + id + " ]";
    }
    
}
