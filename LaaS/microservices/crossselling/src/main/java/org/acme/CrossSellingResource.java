package org.acme;
import jakarta.ws.rs.*;
import org.eclipse.microprofile.reactive.messaging.Emitter;
import org.eclipse.microprofile.reactive.messaging.Channel;
import jakarta.ws.rs.core.MediaType;

@Path("CrossSelling")
public class CrossSellingResource {

    Long id=0L;

    @Channel("CrossSellingRecommendation")
    Emitter<String> crossSellingEmitter;

    @POST
    @Path("Produce")
    @Produces(MediaType.TEXT_PLAIN)
    public String sendCrossSelling(CrossSelling crossSelling) {
        try {
            crossSellingEmitter.send(crossSelling.toJson().toString());
        } catch (Exception e) {
            return e.getMessage();
        }
            return "Message: " + crossSelling.toJson().toString();
        }

    @POST
    @Path("{idCard}/{idShopA}/{idShopB}/{product}")
    public String create(
            @PathParam("idCard") Long idCard,
            @PathParam("idShopA") Long idShopA,
            @PathParam("idShopB") Long idShopB,
            @PathParam("product") String product) {

        CrossSelling crossSelling = new CrossSelling(id, product, idCard, idShopA, idShopB );
        sendCrossSelling(crossSelling);
        id++;
        return "CrossSelling creation successful";
    }
}