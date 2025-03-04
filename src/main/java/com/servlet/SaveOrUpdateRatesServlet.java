package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RatesDao;
import com.entities.Rates;
import com.helper.FactoryProvider;


@WebServlet("/SaveOrUpdateRatesServlet")
public class SaveOrUpdateRatesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveOrUpdateRatesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/// Get rate from form input (in rupees)
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
        double rateInRupees = Double.parseDouble(request.getParameter("ratePerHour"));
        
        // Convert rupees to paise (1 Rupee = 100 Paise)
        long rateInPaise = (long) (rateInRupees * 100);

        // Create a Rates object
        Rates rate = new Rates();
        rate.setRatePerHour(rateInPaise);

        // Get DAO instance and save/update the rate
        RatesDao rateDao = new RatesDao(FactoryProvider.getFactory());
        boolean isSuccess = rateDao.saveOrUpdateRate(rate);

        // Redirect based on operation success/failure
        if (isSuccess) {
        	session.setAttribute("parkingRatesStatus", "Successfully created Parking Rates");
        	//out.print("rates Successful");
            response.sendRedirect("AdminPages/AdminDashBoard.jsp");
        } else {
        	session.setAttribute("parkingRatesStatus", "Failed to Create Parking Rates");
        	//out.print("rates Failed");
            response.sendRedirect("AdminPages/AdminDashBoard.jsp");
        }
	}

}
