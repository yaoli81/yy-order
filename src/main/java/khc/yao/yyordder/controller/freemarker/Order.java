package khc.yao.yyordder.controller.freemarker;

import khc.yao.yyordder.common.util.TimeUtil;
import khc.yao.yyordder.service.order.drink.OrderDrinkService;
import khc.yao.yyordder.service.order.drink.persistent.OrderDrinkPO;
import khc.yao.yyordder.service.order.meal.OrderMealService;
import khc.yao.yyordder.service.order.meal.persistent.OrderMealPO;
import khc.yao.yyordder.service.shopping.cart.ShoppingCartService;
import khc.yao.yyordder.service.shopping.cart.persistent.ShoppingCartPO;
import khc.yao.yyordder.service.store.StoreService;
import khc.yao.yyordder.service.store.persistent.StorePO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/order")
public class Order {
    @Autowired
    private ShoppingCartService shoppingCartService;
    @Autowired
    private StoreService storeService;
    @Autowired
    private OrderMealService orderMealService;
    @Autowired
    private OrderDrinkService orderDrinkService;

    @GetMapping(value = {"/{shoppingCartID}"})
    public String index(ModelMap map, @PathVariable(value = "shoppingCartID") Integer shoppingCartID) {
        Optional<ShoppingCartPO> OptionalPO = shoppingCartService.getShoppingCartByID(shoppingCartID);
        if (OptionalPO.isPresent()) {
            ShoppingCartPO po = OptionalPO.get();
            map.addAttribute("shoppingCartPO", po);

            if ("meal".equals(po.getKind())) {
                List<OrderMealPO> orderMealPOList = orderMealService.getOrderByID(po.getShoppingCartID());
                map.addAttribute("orderMealPOList", orderMealPOList);
            } else {
                List<OrderDrinkPO> orderDrinkPOList = orderDrinkService.getOrderByID(po.getShoppingCartID());
                map.addAttribute("orderDrinkPOList", orderDrinkPOList);
            }

            String status = "open";
            LocalDateTime nowTime = TimeUtil.getNow();
            if (nowTime.isBefore(po.getStartTime())) {
                status = "notOpen";
            } else if (nowTime.isAfter(po.getEndTime())) {
                status = "end";
            }
            map.addAttribute("status", status);

            StorePO storePO = storeService.getStoreByStoreName(po.getStroeName());
            map.addAttribute("storePO", storePO);

            return "/addMealOrder";
        } else {
            return "/index";
        }
    }
}
