from setuptools import setup

setup(
    name='medihunter',
    version='0.1',
    py_modules=['medihunter', 'medicover_session', 'medihunter_notifiers'],
    include_package_data=True,
    install_requires=[
        'click',
        'requests',
        'beautifulsoup4',
        'python-pushover',
    ],
    entry_points='''
        [console_scripts]
        medihunter=medihunter:medihunter
    ''',
)
