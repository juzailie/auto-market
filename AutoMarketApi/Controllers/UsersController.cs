using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Entities;
using Entities.Models;
using Entities.Dto;

namespace AutoMarketApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly AutoMarketContext _context;

        public UsersController(AutoMarketContext context)
        {
            _context = context;
        }

        // GET: api/Users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetAccounts()
        {
            return await _context.Accounts.ToListAsync();
        }

        // GET: api/Users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(int id)
        {
            var user = await _context.Accounts.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }

        // PUT: api/Users/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUser(int id, User user)
        {
            if (id != user.id)
            {
                return BadRequest();
            }

            _context.Entry(user).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Users
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<User>> PostUser(User user)
        {
            _context.Accounts.Add(user);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetUser", new { id = user.id }, user);
        }

        // DELETE: api/Users/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var user = await _context.Accounts.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            _context.Accounts.Remove(user);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool UserExists(int id)
        {
            return _context.Accounts.Any(e => e.id == id);
        }

        // PUT: api/Users/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost("ChangePassword/{id}")]
        public async Task<ActionResult<bool>> ChangePassword(int id, ChangePasswordRequest user)
        {

            User userRecord = _context.Accounts.FirstOrDefault(x => x.id == id);

            if (userRecord == null)
            {
                return NotFound();
            }

            if (userRecord.password != user.currentpassword)
            {
                return Ok(false);
            }

            userRecord.password = user.newpassword;

            _context.Entry(userRecord).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Ok(true);
        }

        [HttpGet("resetpassword/{username}")]
        public ActionResult<ResetPasswordResponse> ResetPassword(string username)
        {

            var temporaryPassword = "password123";

            if (string.IsNullOrEmpty(username))
            {
                return NotFound();
            }

            User userRecord =  _context.Accounts.FirstOrDefault(x => x.username == username);
            if (userRecord == null)
            {
                return NotFound();
            }

            userRecord.password = "password123";
            _context.Entry(userRecord).State = EntityState.Modified;

            try
            {
                _context.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                throw;
            }

            return Ok(new ResetPasswordResponse() { status = true, temporarypassword = temporaryPassword });
        }
    }
}
