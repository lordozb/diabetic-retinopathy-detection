from keras.models import Sequential
from keras.layers import Convolution2D
from keras.layers import MaxPooling2D
from keras.layers import Flatten
from keras.layers import Dense


class CNNModel:

	PADDING='SAME'
	OUTPUT_SHAPES=[32,64,128,256]
	KERNEL_SIZE=(5,5)
	POOL_SIZE=(2,2)

	def __init__(self,img_dims,output_dim):

		self.IMG_DIMS=img_dims
		self.OUTPUT_DIM=output_dim

	def get_model(self):

		model=Sequential()

		#layer 1
		model.add(Convolution2D(filters=CNNModel.OUTPUT_SHAPES[0],kernel_size=CNNModel.KERNEL_SIZE,input_shape=(self.IMG_DIMS['width'],self.IMG_DIMS['height'],self.IMG_DIMS['channels']),activation='relu',padding=CNNModel.PADDING))    
		model.add(MaxPooling2D(pool_size=CNNModel.POOL_SIZE,padding=CNNModel.PADDING))

		#layer 2
		model.add(Convolution2D(filters=CNNModel.OUTPUT_SHAPES[1],kernel_size=CNNModel.KERNEL_SIZE,activation='relu',padding=CNNModel.PADDING))    
		model.add(MaxPooling2D(pool_size=CNNModel.POOL_SIZE,padding=CNNModel.PADDING))

		#layer 3
		model.add(Convolution2D(filters=self.OUTPUT_SHAPES[2],kernel_size=CNNModel.KERNEL_SIZE,activation='relu',padding=CNNModel.PADDING))    
		model.add(MaxPooling2D(pool_size=CNNModel.POOL_SIZE,padding=CNNModel.PADDING))

		#flatten
		model.add(Flatten())

		#fully connected layer
		model.add(Dense(units=CNNModel.OUTPUT_SHAPES[3],activation='relu'))

		#output layer
		model.add(Dense(units=self.OUTPUT_DIM,activation='softmax'))

		model.compile(optimizer='adam',loss='categorical_crossentropy',metrics=['accuracy'])

		return model



