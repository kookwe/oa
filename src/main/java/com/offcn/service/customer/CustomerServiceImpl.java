package com.offcn.service.customer;

import com.offcn.beans.customer.Customer;
import com.offcn.dao.customer.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    CustomerMapper customerMapper;
    @Override
    public List<Customer> getAll() {
        return  customerMapper.selectByExample(null);
    }
}
