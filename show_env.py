import subprocess

def main():
    print("Schematic Dagster runtime environment:")
    print(">> %s" % subprocess.run(['python', '--version'], stdout=subprocess.PIPE).stdout.decode('utf-8').rstrip())
    print(">> %s" % subprocess.run(['dagster', '--version'], stdout=subprocess.PIPE).stdout.decode('utf-8').rstrip())

if __name__ == "__main__":
    main()
