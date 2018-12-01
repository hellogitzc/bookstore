package test;



import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.PropertyConfigurator;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.itheima.mapper.BookMapper;
import com.itheima.mapper.OrderItemMapper;
import com.itheima.mapper.OrdersMapper;
import com.itheima.po.Address;
import com.itheima.po.Book;
import com.itheima.po.OrderItem;
import com.itheima.po.Orders;
import com.itheima.po.User;
import com.itheima.service.AddressService;
import com.itheima.service.OrderItemService;
import com.itheima.service.OrderService;
import com.itheima.service.UserService;

public class TestUnit extends BaseTest{

	 @Autowired 
	  private OrdersMapper orderMapper;
	 @Autowired 
	  private OrderItemMapper orderItemMapper;
	 @Autowired 
	  private BookMapper bookMapper;
	
	 @Autowired 
	  private OrderService orderService;
	 
	@Autowired 
	private AddressService addressService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderItemService orderItemService;
	
          //注意，这里要用接口，因为用到了spring的AOP
  /*@Test*/
 /*  public void inteceptorTest(){ 
    bean.ttst(); 
    
  } */
	 
//	 @Test
//	 public void test(){
//		 PropertyConfigurator.configure(Test.class.getClassLoader().getResource("log4j.properties")); 
////	     try { 
////	        Orders i = this.orderService.selectOrderInfo(11);
////	        PropertyConfigurator.configure(Test.class.getClassLoader().getResource("log4j.properties"));
////	        System.out.println(i.getAddress().getCity()+i.getOrderid()+i.getAddress().getConsignee());
////	     } catch (Exception e) {
////	         e.printStackTrace();
////	     }
//		  User user = userService.user_info(1);
//		 Integer userid =user.getUserid();
//		 List<Address> addressList= addressService.selectAddress(userid);
//		 List<OrderItem> orderItems =this.orderItemService.selectOrderItems(userid);
//		 for(OrderItem e:orderItems) {
//			logger.info(e.getBookname());
//		}
//		 
//	 }
	@Test
	public void test2() {
//		this.orderMapper.update_pay(41);
//		Orders order = this.orderMapper.selectOrderInfo(41);
//		this.orderItemMapper.deleteById(50);
//		this.orderMapper.deleteById(50);
//		System.out.println(order.getIspay());
		List<Book> bookList = this.bookMapper.selectByName("管理");
		for(Book e: bookList) {
		System.out.println(e.getBookname());
		}
		
	}
	 
}

