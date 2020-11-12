/* ****************************************
*******************************************
* author : Administrator
* create time : 2019-11-22 10:53:07
* description : 
*******************************************
** ************************************* */

using System;

namespace Dal
{
	public class RingBuffer<T> : IDisposable
	{
		public bool IsEmpty => _header == _tail;
		public int Length { get; private set; }
		private readonly int _capacity;
		private readonly T[] _buffer;
		private int _header;
		private int _tail;
		private static readonly T DefaultValue = default;

		public RingBuffer(int capacity)
		{
			var realCapacity = capacity;
			_buffer = new T[realCapacity];
			_capacity = realCapacity;
			_header = 0;
			_tail = 0;
			Length = 0;
		}

		public void Enqueue(T v)
		{
			_buffer[_tail] = v;
			_tail = (_tail + 1) & (_capacity - 1);
			Length++;
		}

		public void Enqueue(T[] items)
		{
			Enqueue(items, items.Length);
		}

		public void Enqueue(T[] items, int count)
		{
			for (int i = 0; i < count; i++)
			{
				_buffer[_tail] = items[i];
				_tail = (_tail + 1) & (_capacity - 1);
			}

			Length += count;
		}

		public void Peek(T[] buffers, int count)
		{
			if (buffers == null || buffers.Length < count || count > Length)
			{
				throw new Exception($"buffers不能为空 或 列表中元素不足.count:{count},length:{Length}");
			}

			var tail = (_header + count) & (_capacity - 1);
			if (_header <= tail)
			{
				Array.Copy(_buffer, _header, buffers, 0, count);
			}
			else
			{
				Array.Copy(_buffer, _header, buffers, 0, _capacity - _header);
				if (tail > 0)
				{
					Array.Copy(_buffer, 0, buffers, _capacity - _header, _tail);
				}
			}
		}

		public T Dequeue()
		{
			var v = _buffer[_header];
			_header = (_header + 1) & (_capacity - 1);
			Length--;
			return v;
		}

		public void Dequeue(T[] buffers, int count)
		{
			Peek(buffers, count);
			Dequeue(count);
		}

		public void Dequeue(int count)
		{
			if (count > Length)
			{
				throw new Exception("弹出的数量大于当前长度.弹出:{count},当前:{Length}");
			}

			_header = (_header + count) & (_capacity - 1);
			Length -= count;
		}

		public void Dispose()
		{
			for (int i = 0; i < _buffer.Length; i++)
			{
				_buffer[i] = DefaultValue;
			}

			_header = 0;
			_tail = 0;
			Length = 0;
		}
	}
}