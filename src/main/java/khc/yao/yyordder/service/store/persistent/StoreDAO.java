package khc.yao.yyordder.service.store.persistent;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StoreDAO extends JpaRepository<StorePO, String> {
    StorePO getByStoreName(String storeName);
}
