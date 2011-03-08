// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.domain;

import com.springsource.petclinic.domain.Owner;
import com.springsource.petclinic.domain.Pet;
import com.springsource.petclinic.reference.PetType;
import java.lang.Float;
import java.lang.String;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Pet_Roo_Finder {
    
    public static TypedQuery<Pet> Pet.findPetsByNameAndWeight(String name, Float weight) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        if (weight == null) throw new IllegalArgumentException("The weight argument is required");
        EntityManager em = Pet.entityManager();
        TypedQuery<Pet> q = em.createQuery("SELECT Pet FROM Pet AS pet WHERE pet.name = :name AND pet.weight = :weight", Pet.class);
        q.setParameter("name", name);
        q.setParameter("weight", weight);
        return q;
    }
    
    public static TypedQuery<Pet> Pet.findPetsByOwner(Owner owner) {
        if (owner == null) throw new IllegalArgumentException("The owner argument is required");
        EntityManager em = Pet.entityManager();
        TypedQuery<Pet> q = em.createQuery("SELECT Pet FROM Pet AS pet WHERE pet.owner = :owner", Pet.class);
        q.setParameter("owner", owner);
        return q;
    }
    
    public static TypedQuery<Pet> Pet.findPetsBySendRemindersAndWeightLessThan(boolean sendReminders, Float weight) {
        if (weight == null) throw new IllegalArgumentException("The weight argument is required");
        EntityManager em = Pet.entityManager();
        TypedQuery<Pet> q = em.createQuery("SELECT Pet FROM Pet AS pet WHERE pet.sendReminders = :sendReminders AND pet.weight < :weight", Pet.class);
        q.setParameter("sendReminders", sendReminders);
        q.setParameter("weight", weight);
        return q;
    }
    
    public static TypedQuery<Pet> Pet.findPetsByTypeAndNameLike(PetType type, String name) {
        if (type == null) throw new IllegalArgumentException("The type argument is required");
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        name = name.replace('*', '%');
        if (name.charAt(0) != '%') {
            name = "%" + name;
        }
        if (name.charAt(name.length() -1) != '%') {
            name = name + "%";
        }
        EntityManager em = Pet.entityManager();
        TypedQuery<Pet> q = em.createQuery("SELECT Pet FROM Pet AS pet WHERE pet.type = :type AND LOWER(pet.name) LIKE LOWER(:name)", Pet.class);
        q.setParameter("type", type);
        q.setParameter("name", name);
        return q;
    }
    
}
