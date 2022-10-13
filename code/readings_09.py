import sys
import numpy

def main():
    script = sys.argv[0]
    action = sys.argv[1]
	
    # if no action given
    if action not in ['--min', '--mean', '--max']:
        # set "mean" as the default action
        action = '--mean'  							
		# start the filenames one place earlier in the argv list (no action name passed)
        filenames = sys.argv[1:]
    else:
        filenames = sys.argv[2:]

    #if no files are passed as parameter
    if len(filenames) == 0:
	    #process standard input
        process(sys.stdin, action)
    else:
	    #process each file in the list
        for filename in filenames:
            process(filename, action)

def process(filename, action):
    data = numpy.loadtxt(filename, delimiter=',')

    if action == '--min':
        values = numpy.min(data, axis=1)
    elif action == '--mean':
        values = numpy.mean(data, axis=1)
    elif action == '--max':
        values = numpy.max(data, axis=1)

    for val in values:
        print(val)

if __name__ == '__main__':
    main()
