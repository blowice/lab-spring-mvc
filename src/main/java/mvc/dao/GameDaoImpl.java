package mvc.dao;

import mvc.domain.Country;
import mvc.domain.Li;
import mvc.domain.Player;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 8/07/13
 * Time: 1:43 AM
 */
@Repository("gameDao")
@Transactional
public class GameDaoImpl implements GameDao {
    @Autowired
    private SessionFactory sessionfactory;

    @Override
    public Player getPlayer(String name) {
        try{
            List <Player> playerList = sessionfactory.getCurrentSession().createCriteria(Player.class)
                    .add( Restrictions.eq("playerName", name)).list();
            if(playerList!=null&&playerList.size()>0){
                return playerList.get(0);
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public String createPlayer(Player player) {
        System.out.println("inside createPlayer()");
        try{

            System.out.println("sessionfactory.getCurrentSession()="+sessionfactory.getCurrentSession());
            sessionfactory.getCurrentSession().save(player);
        }catch (Exception ex){
            ex.printStackTrace();
            return ex.getMessage();
        }

        return "ok";
    }

    @Override
    public String editPlayer() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public String deletePlayer() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Li> getLi() {
        List<Li> list = sessionfactory.getCurrentSession()
                .createCriteria(Li.class).list();
        return list;
    }




    public SessionFactory getSessionfactory() {
        return sessionfactory;
    }

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionfactory = sessionfactory;
    }
}
