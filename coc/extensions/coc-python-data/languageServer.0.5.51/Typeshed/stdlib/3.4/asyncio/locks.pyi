from typing import Any, Callable, Generator, Iterable, Iterator, List, Type, TypeVar, Union, Optional, Awaitable

from .coroutines import coroutine
from .events import AbstractEventLoop
from .futures import Future
from types import TracebackType

_T = TypeVar('_T')

__all__: List[str]

class _ContextManager:
    def __init__(self, lock: Union[Lock, Semaphore]) -> None: ...
    def __enter__(self) -> object: ...
    def __exit__(self, *args: Any) -> None: ...

class _ContextManagerMixin(Future[_ContextManager]):
    # Apparently this exists to *prohibit* use as a context manager.
    def __enter__(self) -> object: ...
    def __exit__(self, *args: Any) -> None: ...
    def __aenter__(self) -> Awaitable[None]: ...
    def __aexit__(self, exc_type: Optional[Type[BaseException]], exc: Optional[BaseException], tb: Optional[TracebackType]) -> Awaitable[None]: ...

class Lock(_ContextManagerMixin):
    def __init__(self, *, loop: Optional[AbstractEventLoop] = ...) -> None: ...
    def locked(self) -> bool: ...
    @coroutine
    def acquire(self) -> Generator[Any, None, bool]: ...
    def release(self) -> None: ...

class Event:
    def __init__(self, *, loop: Optional[AbstractEventLoop] = ...) -> None: ...
    def is_set(self) -> bool: ...
    def set(self) -> None: ...
    def clear(self) -> None: ...
    @coroutine
    def wait(self) -> Generator[Any, None, bool]: ...

class Condition(_ContextManagerMixin):
    def __init__(self, lock: Optional[Lock] = ..., *, loop: Optional[AbstractEventLoop] = ...) -> None: ...
    def locked(self) -> bool: ...
    @coroutine
    def acquire(self) -> Generator[Any, None, bool]: ...
    def release(self) -> None: ...
    @coroutine
    def wait(self) -> Generator[Any, None, bool]: ...
    @coroutine
    def wait_for(self, predicate: Callable[[], _T]) -> Generator[Any, None, _T]: ...
    def notify(self, n: int = ...) -> None: ...
    def notify_all(self) -> None: ...

class Semaphore(_ContextManagerMixin):
    def __init__(self, value: int = ..., *, loop: Optional[AbstractEventLoop] = ...) -> None: ...
    def locked(self) -> bool: ...
    @coroutine
    def acquire(self) -> Generator[Any, None, bool]: ...
    def release(self) -> None: ...

class BoundedSemaphore(Semaphore):
    def __init__(self, value: int = ..., *, loop: Optional[AbstractEventLoop] = ...) -> None: ...
