# Skill.md — วิธีทำงานกับ Claude Code (สไตล์ 9arm)

ไฟล์นี้คือ "หน่วยความจำ" ของ workflow ทั้งหมด
ทุกครั้งที่เรียนรู้สิ่งใหม่ → สอน Claude → ให้ Claude เขียนเพิ่มที่นี่

---

## หลักคิดหลัก

> "เราไม่ได้เขียนโค้ดเองแล้ว เราเปลี่ยนจากคนที่ลงไปเขียนโค้ด เป็นคนสั่งแทน"
> — 9arm

- Programming คือแค่ Token ถ้ามี Token ทำอะไรก็ได้
- งานของเราคือ **สั่งได้ถูก** ไม่ใช่ทำเองทุกอย่าง
- เขียน skill.md ดีๆ = คนอื่นก็ทำได้เหมือนกัน
- AI เป็น **amplifier** — ถ้าเก่งอยู่แล้วจะยิ่งเก่ง ถ้าไม่เก่งก็จะเสียนิสัย
- สิ่งที่ AI ทำแทนไม่ได้: **Experience + ภาพใหญ่ + judgement** — ต้องรักษาไว้
- Senior 1 คน + AI = output เท่ากับ Senior 5 คน
- **Simplest & most effective เสมอ** — ก่อน build อะไรใหม่ ถามก่อนว่า "มีอยู่แล้วไหม?"

---

## 1. Workflow การรับ Ticket จาก Lark

เมื่อมี ticket ใหม่เข้า Lark:

```
1. เปิด ticket ใน Lark
2. บอก Claude: "อ่าน ticket นี้แล้วซ่อมให้หน่อย: [วาง ticket content]"
3. Claude จะ:
   - อ่าน ticket
   - ดู skill.md ว่าต้อง setup ยังไง
   - clone / docker / setup environment ตามที่สอนไว้
   - compile + test เอง
   - วน loop จนแก้เสร็จ
   - เขียน PR พร้อม root cause analysis
   - update ticket กลับ
```

**เงื่อนไขสำคัญ:** Claude ทำได้เองต่อเมื่อ skill.md มีข้อมูล setup ครบ

---

## 2. Environment Setup (สอน Claude ไว้แล้ว)

```bash
# Clone project
docker compose up -d

# Code base อยู่ที่
/Users/krittapas/Project/horoacademy-wpe-service

# Run tests
# [เพิ่มคำสั่ง test ที่ใช้จริงตรงนี้]

# Build
# [เพิ่มคำสั่ง build ตรงนี้]
```

---

## 3. Debugging Workflow

เวลามีบัก สอน Claude debug แบบนี้:

```
1. กำหนด scope: อะไรคือ FAIL / อะไรคือ PASS
2. เริ่มกว้างก่อน → narrow down เรื่อยๆ
3. ทุกครั้งที่ทำอะไรใหม่ → เขียนลงไฟล์ log ทุกครั้ง
4. ทุก assumption → ต้อง verify ก่อนเสมอ
   ("ถ้าทฤษฎีของผมถูก ผลลัพธ์จะต้องเป็นแบบนี้")
5. อย่า assume สิ่งที่ยังไม่ได้พิสูจน์
```

Prompt ที่ใช้:
```
debug [feature/bug] นี้ให้หน่อย
- เริ่มจาก scope กว้างก่อนแล้วค่อย narrow down
- verify ทุก assumption ก่อนสรุป
- เขียน log ทุกขั้นตอนที่ทำ
- เมื่อเจอแล้ว เขียน PR พร้อม root cause analysis
```

---

## 4. PR Workflow

```
1. Claude เขียนโค้ด + test
2. เปิด PR
3. ให้ GitHub Copilot / reviewer review
4. บอก Claude: "address Copilot comment ด้วย — อันไหน valid แก้ตาม, อันไหนไม่ valid ให้ comment อธิบายว่าทำไม"
5. Merge
```

---

## 5. Multi-Agent Workflow

เวลาทำหลาย task พร้อมกัน:
- แยก Terminal ตามโปรเจค/งาน
- แต่ละ Terminal = Claude agent อิสระ 1 ตัว
- สั่งงานพร้อมกัน 4-6 agent ได้
- กลับมาตรวจทีละอัน

**Agent Team Design (แนวคิดจาก Open Claw):**
- งานยาก/ซับซ้อน → ใช้ Claude Opus
- งานง่าย/routine → ใช้โมเดลถูกกว่าเพื่อประหยัด token
- ข้อมูลสำคัญ (ตัวเลข, private) → พิจารณาใช้ Local model แทน

---

## 6. Commit Messages

```
สั่ง Claude: "เขียน commit message ตาม conventional commit format"
```

Format:
```
type(scope): short description

feat / fix / refactor / test / docs / chore
```

ผลลัพธ์ใช้ได้เลย ~99% ไม่ต้องแก้

---

## 7. One-Shot Documentation → Code

เวลาได้ spec/doc จากใครมา:
```
1. Copy doc จาก Lark / Microsoft Teams / ที่ไหนก็ได้
2. บอก Claude: "ทำโปรเจคนี้ให้เหมือนกับ doc นี้เลย: [วาง doc]"
3. กด Enter → รอ
```
ไม่ต้องอ่าน doc เองก่อนก็ได้ถ้าเป็นงาน routine

---

## 9. Research / เปรียบเทียบข้อมูล (ไม่ใช่แค่งาน coding)

Claude ทำแทนได้ทุกงานที่ต้อง "รวบรวมและเปรียบเทียบ":

```
ตัวอย่าง:
- โยนลิงก์ 3-5 ตัวเลือก → ให้ทำตาราง pros/cons
- ให้ดูรีวิวจาก forum แล้วสรุป
- คำนวณ / เปรียบเทียบตัวเลข → สรุปเป็น PDF / report
- วิเคราะห์ log จากหลาย source พร้อมกัน
```

Prompt:
```
เปรียบเทียบ [A, B, C] ให้หน่อย โดย:
- ทำตารางเปรียบเทียบ [criteria ที่สนใจ]
- สรุปว่าอันไหนดีที่สุดสำหรับ [use case ของเรา]
```

---

## 10. ใช้ AI เพื่อเรียนรู้ ไม่ใช่แค่ทำงานแทน

> "ถามว่าทำแบบนี้ดีมั้ย มีข้อดีข้อเสียอะไรบ้าง"

- ให้ Claude อธิบาย concept แบบ step-by-step
- ถาม tradeoff ทุกครั้งที่ Claude เสนอวิธีทำ
- อย่าแค่ copy output — ต้องเข้าใจว่ามันทำอะไร
- ใช้ AI เพื่อ **ขยาย** ความรู้ที่มีอยู่แล้ว ไม่ใช่ทดแทน

---

## 11. Token Management

- ตั้ง **cap** ไว้ก่อนเสมอ — ป้องกันเผา budget โดยไม่รู้ตัว
- งานที่ Claude วนลูปยาว (debug, research) กิน token เยอะมาก
- ถ้าบริษัทมีระบบ tracking → ดูทุกวันว่าใช้เท่าไหร่
- Rule of thumb: ถ้า output ที่ได้ > ค่า token → จ่ายได้เสมอ

---

## 12. Simplest & Most Effective — ก่อน build ต้อง check ก่อนเสมอ

> "ข้อมูลมีอยู่แล้วไหม? ก่อนจะ build infrastructure ใหม่"

**หลักการ:** Solution ที่ดีที่สุด = แก้ได้ + maintain ง่าย + code น้อยที่สุด

**Checklist ก่อนเริ่ม build ทุกครั้ง:**
```
1. ข้อมูลที่ต้องการมีอยู่ใน DB / snapshot / response แล้วไหม?
2. มี utility / helper / method ที่ทำสิ่งนี้อยู่แล้วไหม?
3. แก้ที่ UI layer ได้เลยไหม? (ไม่ต้อง migrate / backfill)
4. ถ้าแก้ 1 ไฟล์ได้ → อย่าแก้ 2 ไฟล์
5. ถ้าไม่ต้อง deploy 2 repo → อย่า deploy 2 repo
```

**ตัวอย่างจริง (WPE bank tracking session):**
- ปัญหา: ธนาคาร : (ว่าง) ใน backoffice รายการชำระเงิน สำหรับ WPE entries
- แนวทางแรก (ผิด): เพิ่ม `bank_id` ใน sync mapper + backfill command + supervisord entry → 2 repos, migration
- แนวทางที่ถูก: `bank_name` มีอยู่ใน `task_snapshot['payments'][0]['bank_name']` ตั้งแต่แรก → แก้ UI อ่านจาก snapshot → 1 ไฟล์, 12 บรรทัด, ไม่ต้อง backfill

**คำถามที่ต้องถามตอน grill / planning:**
```
"ข้อมูลที่ต้องการมีอยู่ใน codebase แล้วไหม ก่อนที่จะ build ใหม่?"
```

---

## 8. เมื่อเรียนรู้อะไรใหม่

**ทุกครั้งที่ค้นพบ workflow ใหม่ / trick ใหม่:**

```
1. สอน Claude วิธีทำ
2. บอก Claude: "เขียนสิ่งที่เพิ่งสอนเป็น skill ใน skill.md ให้หน่อย"
3. Claude จะเขียนเพิ่มในไฟล์นี้เอง
4. รอบต่อไป Claude จำได้เอง
```

> "กูไม่ได้เขียนเอง — กูสอนมัน แล้วมันเขียนสกิลให้กู"
> — 9arm

---

## 13. Git Workflow — Pull ก่อน Commit เสมอ (ป้องกัน code ทับกัน)

> "paranoid ดีกว่า — pull ก่อนเสมอ code ทีมไม่หาย"

### ขั้นตอนมาตรฐาน (ทุกครั้งก่อน commit)

```bash
git pull origin <branch>   # 1. ดึง code ล่าสุดของทีมก่อน
# แก้ code / fix bug
git add <files>
git commit -m "type: description"   # 2. commit
git push origin <branch>            # 3. push
```

### กรณีมี PR เปิดอยู่แล้ว

```bash
git pull origin dev    # sync ก่อน
git add ...
git commit -m "..."
git push origin dev    # PR รับ commit ใหม่อัตโนมัติ ไม่ต้องเปิดใหม่
```

### ทำไมต้อง pull ก่อน?

- `git pull` จะแจ้ง conflict ทันทีถ้ามีคนแก้ไฟล์เดียวกัน — ไม่ silent overwrite
- ถ้า pull แล้ว "Already up to date" = ปลอดภัย 100%
- ถ้ามี conflict → git หยุดรอแก้ก่อน → code ทีมไม่หาย

### ตรวจสอบสถานะ

```bash
git status                    # ดูไฟล์ที่เปลี่ยน
git log --oneline -5          # ดู commit ล่าสุด 5 อัน
git branch --show-current     # ยืนยัน branch ถูก
```

### สัญญาณอันตราย ❌

- commit โดยไม่ pull ก่อน → เสี่ยง conflict ตอน push
- `git push --force` → ห้ามทำบน shared branch (dev/main) เด็ดขาด
- commit บน branch ผิด → เช็ค `git branch` ก่อนเสมอ

---

## Skills ที่ทำได้ตอนนี้

- [x] อ่าน Lark ticket แล้วแก้บัก
- [x] เปิด PR พร้อม root cause analysis
- [x] อัปเดต ticket หลัง PR เสร็จ
- [x] Debug แบบ narrow-down
- [x] เขียน conventional commit message
- [x] Address Copilot review comments
- [x] Research / เปรียบเทียบข้อมูลหลาย source
- [x] One-shot doc → code
- [x] Git pull → commit → push (ป้องกัน code ทับกัน)
- [ ] Spawn parallel agents (เพิ่ม workflow ตรงนี้เมื่อพร้อม)
- [ ] Agent team design (งานยาก Opus / งานง่าย Haiku)

---

## ต้นทุน vs มูลค่า

- ค่า token/วัน: ~$80-100 (9arm)
- มูลค่างานที่แก้: สูงกว่าจ้าง engineer 2 อาทิตย์
- ถ้า output > ราคา token → จ่ายได้เสมอ
- ตั้ง cap ไว้ก่อนเสมอ — ป้องกันเผา budget โดยไม่รู้ตัว
