package mvc.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 8/07/13
 * Time: 1:54 AM
 */
@Entity
@Table(name = "myapp.player")
public class Player implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "player_id")
    private Integer playerId;

    @Column(name = "player_name")
    private String playerName;

    @Column(name = "player_password")
    private String playerPassword;

    @Column(name = "sex")
    private String sex;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "login_time")
    private Date loginTime;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "register_time")
    private Date registerTime ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "last_active_time")
    private Date lastActiveTime;

    @Column(name = "hp")
    private Integer hp;

    @Column(name = "exp")
    private Long exp;

    @Column(name = "power")
    private Integer power;

    @Column(name = "speed")
    private Integer speed;

    @Column(name = "wisdom")
    private Integer wisdom;

    @Column(name = "blood")
    private Integer blood;

    @Column(name = "mood")
    private String mood;

    @Column(name = "skill_point")
    private Integer skillPoint;

    @Column(name = "level")
    private Integer level;

    @OneToOne(optional = true)
    @JoinColumn(name="li_id")
    Li li;

    public Li getLi() {
        return li;
    }

    public void setLi(Li li) {
        this.li = li;
    }

    public Integer getPlayerId() {
        return playerId;
    }

    public void setPlayerId(Integer playerId) {
        this.playerId = playerId;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public String getPlayerPassword() {
        return playerPassword;
    }

    public void setPlayerPassword(String playerPassword) {
        this.playerPassword = playerPassword;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Date getLastActiveTime() {
        return lastActiveTime;
    }

    public void setLastActiveTime(Date lastActiveTime) {
        this.lastActiveTime = lastActiveTime;
    }

    public Integer getHp() {
        return hp;
    }

    public void setHp(Integer hp) {
        this.hp = hp;
    }

    public Long getExp() {
        return exp;
    }

    public void setExp(Long exp) {
        this.exp = exp;
    }

    public Integer getPower() {
        return power;
    }

    public void setPower(Integer power) {
        this.power = power;
    }

    public Integer getSpeed() {
        return speed;
    }

    public void setSpeed(Integer speed) {
        this.speed = speed;
    }

    public Integer getWisdom() {
        return wisdom;
    }

    public void setWisdom(Integer wisdom) {
        this.wisdom = wisdom;
    }

    public Integer getBlood() {
        return blood;
    }

    public void setBlood(Integer blood) {
        this.blood = blood;
    }

    public String getMood() {
        return mood;
    }

    public void setMood(String mood) {
        this.mood = mood;
    }

    public Integer getSkillPoint() {
        return skillPoint;
    }

    public void setSkillPoint(Integer skillPoint) {
        this.skillPoint = skillPoint;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
}
