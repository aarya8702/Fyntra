package org.admin.dao;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
@Repository
public class AncillaryDaoImpl {

	public static File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException 
	{
	    File convFile = new File( multipart.getOriginalFilename());
	    multipart.transferTo(convFile);
	    return convFile;
	}
	
	public static String uploadImage( MultipartFile file ) {
		
		try {
			
			Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
					  "cloud_name", AncillaryDao.cloud_name,
					  "api_key", AncillaryDao.cloudAPi,
					  "api_secret", AncillaryDao.cloudSecret));
			
			Map uploadResult = cloudinary.uploader().upload( multipartToFile(file) , ObjectUtils.emptyMap());
			
			return uploadResult.get("secure_url").toString();
			
		}
		catch( Exception e ) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
}
