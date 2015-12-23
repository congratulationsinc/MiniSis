
package org.umss.sisii.minisis.resource;

import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.umss.sisii.minisis.database.DBManager;
import org.umss.sisii.minisis.model.Task;
import org.umss.sisii.minisis.model.User;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Anthony
 */
@Path("/user")
@Produces(MediaType.APPLICATION_JSON)
public class UserResource {

    private final DBManager manager = DBManager.getInstance();

    @POST
    public User checkUserExample(User user) {
        if (manager.checkUser(user.getUserName(), user.getUserPassword())) {
            return user;
        }
        throw new IllegalStateException("ahhhh...");
    }
    
    @GET
    public List<Task> getAllTasks() {
        return manager.getAllTasks();
    }
}
