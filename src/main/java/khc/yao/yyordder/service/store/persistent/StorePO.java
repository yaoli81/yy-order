package khc.yao.yyordder.service.store.persistent;

import khc.yao.yyordder.common.YYOrderConstant;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = YYOrderConstant.TBL_STORE, schema = YYOrderConstant.DATABASE_SCHEMA)
public class StorePO {
    @Id
    @Column(name = "store_id")
    private int storeID;

    @Column(name = "kind")
    private String kind;

    @Column(name = "store_name")
    private String storeName;

    @Column(name = "menu_url")
    private String menuURL;
}
