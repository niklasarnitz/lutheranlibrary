\version "2.24.3"
% Scan 139, printed p. 114: full Advent Kyrie page.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 124\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
shortBar = { \bar "," }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \key f \major \time 4/4 \cadenzaOn \accidentalStyle forget
      \new Voice = "sung" { \voiceOne
        f'2 g'4 a'4 \shortBar f'1 \bar "|" bes'4 a'4 g'4 a'4 \shortBar f'1 \bar "|" e'2 f'2 \shortBar g'4 g'4 f'4 e'4 \shortBar \break
        d'2. e'4 \shortBar c'1 \bar "|" r4 f'4 e'4 d'4 \shortBar e'2 f'2 \bar "||" r2 c''2 \shortBar d''2 c''2 \shortBar \break
        bes'2 c''2 \shortBar e'1 \bar "|" r4 bes'4 a'4 g'4 \shortBar g'2 f'2 \shortBar e'2 f'2 \shortBar g'1 \bar "|" r4 g'4 \shortBar
      }
      \new Voice { \voiceTwo
        c'2 e'4 f'4 c'1 f'4 f'4 e'4 c'4 d'1 c'2 a2 c'4 c'4 c'4 <a c'>4( \break
        c'4) b!8[ a8(] b4) c'4 c'1 r4 c'4 c'4 a4 c'2 c'2 r2 d'2 e'2 e'2 \break
        d'2 e'2 e'1 r4 f'4 f'4 e'4 e'2 a4( bes4 c'4) c'2 c'4 e'1 r4 e'4
      }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t
      O mil -- der "Gott," al -- ler -- höch -- ster "Hort," wir ru -- fen zu dir in
      uns -- rer "Noth," er -- barm dich un -- "ser!" O Chri -- "ste,"
      Got -- tes "Sohn," der Kir -- che "Haupt," "Freud," Ehr und Kron und
    }
    \new Staff <<
      \clef bass \key f \major \time 4/4 \cadenzaOn \accidentalStyle forget
      \new Voice { \voiceOne
        a2 c'4 c'4 a1 e'4 c'4 c'4 a4 bes1 g2 d'2 g4 g4 a4 g4 \break
        g2. a4 g1 r4 a4 g4 f4 g2 a2 r2 g2 c'2 a2 \break
        bes2 a2 a1 r4 e'4 c'4 c'4 c'2 d'2 g2 a2 c'1 r4 c'4
      }
      \new Voice { \voiceTwo
        f2 bes,4 f4 f1 c4 f4 c4 f4 bes,1 bes,2 c2 e4 e4 f4 bes,4 \break
        g,2. c4 c1 r4 f4 c4 d4 c2 g,2 r2 c2 a,2 f2 \break
        f2 c2 f1 r4 bes,4 f4 bes,4 f2 d2 c2 f2 c1 r4 bes,4
      }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" \autoBeamOff } \context { \Staff \override BarLine.short-bar-extent = #'(0 . 2) } \context { \Lyrics \override LyricText.font-size = #-2 } }
}
