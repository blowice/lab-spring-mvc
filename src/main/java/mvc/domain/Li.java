package mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 8/07/13
 * Time: 2:13 AM
 */
@Entity
@Table(name = "myapp.ninja_li")
public class Li implements Serializable {
    @Id
    @Column(name = "li_id")
    private Integer liId;

    @Column(name = "li_name")
    private String liName;

    @Column(name = "li_description")
    private String liDescription;

    public Integer getLiId() {
        return liId;
    }

    public void setLiId(Integer liId) {
        this.liId = liId;
    }

    public String getLiName() {
        return liName;
    }

    public void setLiName(String liName) {
        this.liName = liName;
    }

    public String getLiDescription() {
        return liDescription;
    }

    public void setLiDescription(String liDescription) {
        this.liDescription = liDescription;
    }
}
