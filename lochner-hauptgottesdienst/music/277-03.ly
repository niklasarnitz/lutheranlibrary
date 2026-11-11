\version "2.24.3"
% Lochner, Brandenburg-Nürnbergische Weise. PDF scan 277, printed p. 252.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 150\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { \voiceOne
        a'1 bes'1( a'1 g'1) f'1 g'1 \bar "|"
        g'1( a'1 g'1 f'1 ees'1) g'\breve\fermata \bar "||"
      }
      \new Voice { \voiceTwo
        <c' f'>1 <d' f'>1( <c' f'>1 d'1) d'1 e'1
        e'1( f'1 d'\breve) s1 d'1 s1
      }
    >>
    \new Lyrics \lyricsto "melody" {
      \set ignoreMelismata = ##t
      in E -- \skip 1 \skip 1 wig -- "keit." A \skip 1 \skip 1 \skip 1 \skip 1 "men."
    }
    \new Staff <<
      \clef bass \global
      \new Voice { \voiceOne
        s1 s1 s1 bes1 a1 c'1
        c'\breve( bes1 a1) c'1 b!1 s1
      }
      \new Voice { \voiceTwo
        f1 bes,1( f,1 g,1) d1 c1
        c1( f,1 g,1 d1) c1 g,1_\fermata s1
      }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
