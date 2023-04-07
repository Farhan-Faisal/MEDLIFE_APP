import SwiftUI
import FirebaseStorage

public class StorageManager: ObservableObject {
    let storage = Storage.storage()
    @Published var retrievedImages: [UIImage] = []
    
    func upload(image: UIImage, uploadName: String, execID: String, taskID: String) {
          // Create a storage reference
          let storageRef = storage.reference().child("images/\(execID)/\(taskID)/\(uploadName).jpg")

          // Convert the image into JPEG and compress the quality to reduce its size
          let data = image.jpegData(compressionQuality: 0.2)

          // Change the content type to jpg. If you don't, it'll be saved as application/octet-stream type
          let metadata = StorageMetadata()
          metadata.contentType = "image/jpg"

          // Upload the image
          if let data = data {
              storageRef.putData(data, metadata: metadata) { (metadata, error) in
                  if let error = error {
                      print("Error while uploading file: ", error)
                  }

                  if let metadata = metadata {
                      print("Metadata: ", metadata)
                  }
              }
          }
      }
    
    func listAllFiles(execID: String, taskID: String) {
        // Create a reference
        let storageRef = storage.reference().child("images/\(execID)/\(taskID)/")
        storageRef.listAll { (result, error) in
          if let error = error {
            print("Error while listing all files: ", error)
          }

        for item in result!.items {
            print("Item in images folder: ", item)
          }
        }
    }
    

    func downloadImages(execID: String, taskID: String) {
        let loc = storage.reference().child("images/\(execID)/\(taskID)/")
        loc.listAll{(result,error) in
            
            if let images = result {
                print("number of Images: ", images.items.count)
                
                for item in images.items {
                    print("images url : " , item)
                    
                    item.getData(maxSize: 15 * 1024 * 1024) { data, error in
                        if let error = error {
                            print("\(error)")
                        }
                        DispatchQueue.main.async {
                            if let theData = data, let image = UIImage(data: theData) {
                                self.retrievedImages.append(image)
                                print("image received")
                            }
                        }
                    }
                }
                
                
                
                
            }
            
        }
        
    }
    
    
}
