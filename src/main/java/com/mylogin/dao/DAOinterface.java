package com.mylogin.dao;

import java.util.ArrayList;

/**
 *
 * @author robot
 */
public interface DAOinterface<T> {
    public int insert(T t);
    
    public boolean update(T t);
    
    public int delete(String t);
    
    public ArrayList<T> selectAll();
    
    public T selectById(int t);
    
    
    int getAutoIncrement();
}
