import argparse

def get_args():
	parser = argparse.ArgumentParser(description='Train the UNet on images and target masks',
									 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
	parser.add_argument('-r', '--epochs', metavar='E', type=float, default=0.1,
						help='Number of epochs', dest='epochs')
	parser.add_argument('-f', '--batch-size',
						help='Batch size', dest='batchsize')
						
	return parser.parse_args()
						
if __name__ == '__main__':
	args = get_args() 
	print(args.epochs)
	print(args.batchsize)
