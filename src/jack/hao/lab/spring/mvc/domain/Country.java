package jack.hao.lab.spring.mvc.domain;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 27/05/13
 * Time: 8:59 AM
 */

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "alameda.countries")
@NamedQueries(value = {
        @NamedQuery(name = "Country.findAll", query = "SELECT c FROM Country c order by c.id asc")
})
public class Country implements Serializable {
    @Id
    @Column(name = "id")
    private Integer id;

    @Column(name = "code")
    private String code;

    @Column(name = "description")
    private String description;

    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;

    @Column(name = "nationality_name")
    private String nationalityName;

    @Column(name = "region_id")
    private Integer regionId;

    @Column(name = "idd")
    private Integer idd;

    @Column(name = "state_label")
    private String stateLabel;

    @Column(name = "currency_id")
    private Integer currencyId;

    @Column(name = "states_count")
    private Integer statesCount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getNationalityName() {
        return nationalityName;
    }

    public void setNationalityName(String nationalityName) {
        this.nationalityName = nationalityName;
    }

    public Integer getRegionId() {
        return regionId;
    }

    public void setRegionId(Integer regionId) {
        this.regionId = regionId;
    }

    public Integer getIdd() {
        return idd;
    }

    public void setIdd(Integer idd) {
        this.idd = idd;
    }

    public String getStateLabel() {
        return stateLabel;
    }

    public void setStateLabel(String stateLabel) {
        this.stateLabel = stateLabel;
    }

    public Integer getCurrencyId() {
        return currencyId;
    }

    public void setCurrencyId(Integer currencyId) {
        this.currencyId = currencyId;
    }

    public Integer getStatesCount() {
        return statesCount;
    }

    public void setStatesCount(Integer statesCount) {
        this.statesCount = statesCount;
    }
}
