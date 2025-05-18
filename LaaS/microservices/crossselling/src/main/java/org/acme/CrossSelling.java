package org.acme;
import io.vertx.core.json.JsonObject;

public class CrossSelling {
    public Long id;
    public Long idCard;
    public Long idShopA;
    public Long idShopB;
    public String product;

    public CrossSelling(Long id, String product, Long idCard, Long idShopA, Long idShopB){
        this.id=id;
        this.product=product;
        this.idCard=idCard;
        this.idShopA=idShopA;
        this.idShopB=idShopB;
    }

    public CrossSelling(){
    }

    @Override
    public String toString(){
        return "CrossSelling{"+"id="+id+", "+
                "product="+product+", "+
                "idCard="+idCard+", "+
                "idShopA="+idShopA+", "+
                "idShopB="+idShopB+", ";
    }

    public JsonObject toJson(){
        JsonObject recommendation = new JsonObject()
                .put("id", id)
                .put("product", product)
                .put("idCard", idCard)
                .put("idShopA", idShopA)
                .put("idShopB", idShopB);
        return new JsonObject().put("CrossSelling_Event", recommendation);
    }
}