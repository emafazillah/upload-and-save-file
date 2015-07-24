/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.Testcasetxn2;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 *
 * @author EMA
 */
@Stateless
@Path("/testcasetxn2")
public class Testcasetxn2FacadeREST extends AbstractFacade<Testcasetxn2> {
    @PersistenceContext(unitName = "testcase2_testcase2_war_1.0PU")
    private EntityManager em;

    public Testcasetxn2FacadeREST() {
        super(Testcasetxn2.class);
    }

    @POST
    @Override
    @Consumes({"application/json"})
    public void create(Testcasetxn2 entity) {
        super.create(entity);
    }

    @PUT
    @Path("/{id}")
    @Consumes({"application/json"})
    public void edit(@PathParam("id") Long id, Testcasetxn2 entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("/{id}")
    public void remove(@PathParam("id") Long id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("/{id}")
    @Produces({"application/json"})
    public Testcasetxn2 find(@PathParam("id") Long id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/json"})
    public List<Testcasetxn2> findAll() {
        return super.findAll();
    }

    @GET
    @Path("/{from}/{to}")
    @Produces({"application/json"})
    public List<Testcasetxn2> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("/count")
    @Produces("text/plain")
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}
