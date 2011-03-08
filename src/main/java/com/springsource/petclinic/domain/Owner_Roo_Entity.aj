// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.domain;

import com.springsource.petclinic.domain.Owner;
import java.lang.Long;
import java.util.List;
import javax.persistence.Entity;

privileged aspect Owner_Roo_Entity {
    
    declare @type: Owner: @Entity;
    
    public static long Owner.countOwners() {
        return entityManager().createQuery("select count(o) from Owner o", Long.class).getSingleResult();
    }
    
    public static List<Owner> Owner.findAllOwners() {
        return entityManager().createQuery("select o from Owner o", Owner.class).getResultList();
    }
    
    public static Owner Owner.findOwner(Long id) {
        if (id == null) return null;
        return entityManager().find(Owner.class, id);
    }
    
    public static List<Owner> Owner.findOwnerEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Owner o", Owner.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}