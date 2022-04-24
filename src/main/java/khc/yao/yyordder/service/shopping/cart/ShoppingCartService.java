package khc.yao.yyordder.service.shopping.cart;

import khc.yao.yyordder.common.util.TimeUtil;
import khc.yao.yyordder.service.shopping.cart.persistent.ShoppingCartDAO;
import khc.yao.yyordder.service.shopping.cart.persistent.ShoppingCartPO;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class ShoppingCartService {
    private final ShoppingCartDAO shoppingCartDAO;

    public ShoppingCartService(ShoppingCartDAO shoppingCartDAO) {
        this.shoppingCartDAO = shoppingCartDAO;
    }

    public Optional<ShoppingCartPO> getShoppingCartByID(Integer id) {
        return shoppingCartDAO.findById(id);
    }

    public List<ShoppingCartPO> getNotExpiredShoppingCart() {
        return shoppingCartDAO.getNotExpiredShoppingCart(TimeUtil.getStandardDateTimeFormatter().format(TimeUtil.getNow()));
    }

    public List<ShoppingCartPO> getHistoryShoppingCart() {
        return shoppingCartDAO.get10ShoppingCartHistory(TimeUtil.getStandardDateTimeFormatter().format(TimeUtil.getNow()));
    }

    public ShoppingCartPO saveShoppingCart(String mealType, String owner, String store, String timeType, String quickTime, String customizeOpenTime, String customizeEndTime) {
        ShoppingCartPO po = new ShoppingCartPO();
        po.setKind(mealType);
        po.setOwner(owner);
        po.setStroeName(store);
        if ("quick".equals(timeType)) {
            LocalDateTime startTime = TimeUtil.getNow();
            po.setStartTime(startTime);
            po.setEndTime(startTime.plusMinutes(Integer.parseInt(quickTime)));
        } else {
            String tempStartTime = customizeOpenTime.replace("T", " ") + ":00";
            String tempEndTime = customizeEndTime.replace("T", " ") + ":00";
            LocalDateTime startTime = LocalDateTime.parse(tempStartTime, TimeUtil.getStandardDateTimeFormatter());
            po.setStartTime(startTime);
            LocalDateTime endTime = LocalDateTime.parse(tempEndTime, TimeUtil.getStandardDateTimeFormatter());
            po.setEndTime(endTime);
        }
        return shoppingCartDAO.save(po);
    }
}
