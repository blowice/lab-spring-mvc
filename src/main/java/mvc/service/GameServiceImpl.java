package mvc.service;

import mvc.dao.GameDao;
import mvc.domain.Li;
import mvc.domain.Player;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 8/07/13
 * Time: 2:25 AM
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
public class GameServiceImpl implements GameService {
    @Autowired
    GameDao gameDao;

    @Override
    public Player getPlayerByName(String name) {
        return gameDao.getPlayer(name);
    }

    @Override
    public String createPlayer(Player player) {
        return gameDao.createPlayer(player);
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
        return gameDao.getLi();  //To change body of implemented methods use File | Settings | File Templates.
    }
}
