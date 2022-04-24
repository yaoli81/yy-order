package khc.yao.yyordder.service.store;

import khc.yao.yyordder.service.store.persistent.StoreDAO;
import khc.yao.yyordder.service.store.persistent.StorePO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreService {
    private final StoreDAO storeDAO;

    public StoreService(StoreDAO storeDAO) {
        this.storeDAO = storeDAO;
    }

    public List<StorePO> getAll() {
        return storeDAO.findAll();
    }

    public StorePO saveStore(String mealType, String store, String menuLink) {
        StorePO po = new StorePO();
        po.setKind(mealType);
        po.setStoreName(store);
        po.setMenuURL(menuLink);
        return storeDAO.save(po);
    }

    public StorePO getStoreByStoreName(String storeName) {
        return storeDAO.getByStoreName(storeName);
    }
}
