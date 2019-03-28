package com.internousdev.neptune.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.neptune.dao.DestinationInfoDAO;
import com.internousdev.neptune.dto.DestinationInfoDTO;
import com.internousdev.neptune.dto.MCategoryDTO;
import com.opensymphony.xwork2.ActionSupport;

public class SettlementConfirmAction extends ActionSupport implements SessionAware{

	private Collection<String> checkList;
	private int categoryId;
	private List<MCategoryDTO> mCategoryDTOList = new ArrayList<MCategoryDTO>();
	private Map<String, Object> session;

	public String execute(){
		if(session.isEmpty()){
			return "sessionErr";
		}
		String result = ERROR;
		if(session.containsKey("userId")){

			DestinationInfoDAO destinationInfoDAO = new DestinationInfoDAO();
			List<DestinationInfoDTO> destinationInfoDTOList = new ArrayList<>();
			destinationInfoDTOList = destinationInfoDAO.getDestinationInfo(String.valueOf(session.get("userId")));
			Iterator<DestinationInfoDTO> iterator = destinationInfoDTOList.iterator();

			if(!(iterator.hasNext())){
				destinationInfoDTOList = null;
			}
			session.put("destinationInfoDTOList", destinationInfoDTOList);
		}
		if(!session.containsKey("userId")){
			result = ERROR;
			session.put("cartFlg", "1");
		}else{
			result = SUCCESS;
		}
		return result;
	}

	public Collection<String> getCheckList() {
		return checkList;
	}

	public void setCheckList(Collection<String> checkList) {
		this.checkList = checkList;
	}

	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public List<MCategoryDTO> getMCategoryDTOList() {
		return mCategoryDTOList;
	}
	public void setMCategoryDTOList(List<MCategoryDTO> mCategoryDTOList) {
		this.mCategoryDTOList = mCategoryDTOList;
	}
	public Map<String, Object> getSession(){
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session){
		this.session = session;
	}
}
