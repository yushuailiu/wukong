/**
 * MIT License
 * 
 * Copyright (c) 2024 刘帅
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

package wukong

import std.unittest.testmacro.*

@Test
public class CommandTest {
    @TestCase
    public func testGroup() {
        let command = WKCommand("test")
        let group = Group("test", "test")
        let group2 = Group("test2", "test2")

        command.addGroup(group)
        command.addGroup(group2)

        @Assert(command.use, "test")
        @Assert(command.getCommandGroups().size, 2)
        @Assert(command.getCommandGroups()[0].ID, "test")
        @Assert(command.getCommandGroups()[1].Title, "test2")

        let group3 = Group("test", "test")

        @AssertThrows[WKException]({
            command.addGroup(group3)
        })
    }
}