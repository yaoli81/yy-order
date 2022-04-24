package khc.yao.yyordder.controller.freemarker;

import khc.yao.yyordder.common.util.TimeUtil;
import khc.yao.yyordder.controller.freemarker.vo.ShoppingCartVO;
import khc.yao.yyordder.service.order.drink.OrderDrinkService;
import khc.yao.yyordder.service.order.meal.OrderMealService;
import khc.yao.yyordder.service.shopping.cart.ShoppingCartService;
import khc.yao.yyordder.service.shopping.cart.persistent.ShoppingCartPO;
import khc.yao.yyordder.service.store.StoreService;
import khc.yao.yyordder.service.store.persistent.StorePO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class ShoppingCart {
    @Autowired
    private ShoppingCartService shoppingCartService;
    @Autowired
    private StoreService storeService;
    @Autowired
    private OrderMealService orderMealService;
    @Autowired
    private OrderDrinkService orderDrinkService;

    @GetMapping(value = {""})
    public String index(ModelMap map) {
        List<ShoppingCartPO> shoppingCartPOList = shoppingCartService.getNotExpiredShoppingCart();
        List<ShoppingCartVO> shoppingCartVOList = new ArrayList<>();
        for (ShoppingCartPO po : shoppingCartPOList) {
            shoppingCartVOList.add(shoppingCartPOToShoppingCartVO(po));
        }
        map.addAttribute("shoppingCartVOList", shoppingCartVOList);
        return "/index";
    }

    @GetMapping(value = {"/history"})
    public String history(ModelMap map) {
        List<ShoppingCartPO> shoppingCartPOList = shoppingCartService.getHistoryShoppingCart();
        List<ShoppingCartVO> shoppingCartVOList = new ArrayList<>();
        for (ShoppingCartPO po : shoppingCartPOList) {
            shoppingCartVOList.add(shoppingCartPOToShoppingCartVO(po));
        }
        map.addAttribute("shoppingCartVOList", shoppingCartVOList);
        return "/history";
    }

    private ShoppingCartVO shoppingCartPOToShoppingCartVO(ShoppingCartPO po) {
        ShoppingCartVO vo = new ShoppingCartVO();
        vo.setShoppingCartID(po.getShoppingCartID());
        vo.setKind(po.getKind());
        vo.setStoreName(po.getStroeName());
        vo.setStartTime(po.getStartTime());
        vo.setEndTime(po.getEndTime());
        vo.setTotalPrice(po.getTotalPrice());
        vo.setOpenFlag("N");
        vo.setCountdownFlag("N");
        vo.setCountdownMinute("0");
        vo.setCountdownSecond("0");
        LocalDateTime now = TimeUtil.getNow();
        if (now.isBefore(po.getStartTime())) {
            Duration duration = Duration.between(now, po.getStartTime());
            // 小於 1 小時才倒數
            if (duration.toHours() < 1) {
                vo.setCountdownFlag("Y");
                vo.setCountdownMinute(String.valueOf(duration.toMinutesPart()));
                vo.setCountdownSecond(String.valueOf(duration.toSecondsPart()));
            }
        } else {
            vo.setOpenFlag("Y");
            Duration duration = Duration.between(now, po.getEndTime());
            // 小於 1 小時才倒數
            if (duration.toHours() < 1) {
                vo.setCountdownFlag("Y");
                vo.setCountdownMinute(String.valueOf(duration.toMinutesPart()));
                vo.setCountdownSecond(String.valueOf(duration.toSecondsPart()));
            }
        }
        return vo;
    }

    @GetMapping("/addShoppingCart")
    public String addShoppingCart(ModelMap map) {
        List<StorePO> storePOList = storeService.getAll();
        Map<String, List<StorePO>> kindMapStoreList = new HashMap<>();
        kindMapStoreList.put("meal", new ArrayList<>());
        kindMapStoreList.put("drink", new ArrayList<>());
        for (StorePO po : storePOList) {
            kindMapStoreList.get(po.getKind()).add(po);
        }

        map.addAttribute("kindMapStoreList", kindMapStoreList);
        return "/add-shopping-cart";
    }
}
