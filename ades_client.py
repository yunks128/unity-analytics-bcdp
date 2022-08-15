import inspect
import requests

def create_api_client(host, port):
    base_url = f'http://{host}:{port}'
    info = requests.get(base_url).json()['landingPage']['links']
    class _Client:
        def __init__(self):
            self.session = requests.Session()
    for api in info:
        endpoint = api['href']
        name = api['title']
        req_type = api['type'].lower()
        chunk = endpoint
        params = []
        while len(chunk):
            nargs = chunk.count('<')
            if nargs == 0:
                break
            start = chunk.index('<') + 1
            end = chunk.index('>')
            arg_name = chunk[start:end]
            params.append(inspect.Parameter(arg_name, inspect.Parameter.POSITIONAL_OR_KEYWORD))
            chunk = chunk[end+1:]
        def create_wrapper(base_url, endpoint, req_type, params):
            def wrapper(self, *args, **kwargs):
                url = base_url + endpoint.replace('<', '{').replace('>', '}')
                format_dict = {arg.name: args[i] for i, arg in enumerate(params)}
                url = url.format(**format_dict)
                send_req = getattr(self.session, req_type)
                return send_req(url, **kwargs).json()
            return wrapper
        wrapper = create_wrapper(base_url, endpoint, req_type, params)
        sig = inspect.signature(wrapper)
        params2 = params + [sig.parameters['kwargs']]
        setattr(_Client, name, wrapper)
    return _Client()
