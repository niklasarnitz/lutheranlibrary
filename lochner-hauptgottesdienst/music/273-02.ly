\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 273, printed p. 248.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 145\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \global
      \new Voice = "pastor" { \voiceOne c''2 b'!2 b'2 b'2 \bar "|" d''1 c''1 \bar "|" b'!1( a'1) \bar "|" g'1( f'1) \bar "|" g'\breve \bar "||"  }
      \new Voice { \voiceTwo e'2 g'2 g'2 g'2 \bar "|" f'1 e'1 \bar "|" e'1( f'1) \bar "|" e'1( d'1) \bar "|" d'2~( d'4 c'4 d'1) \bar "||"  }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t Herr -- lich -- keit in E -- wig -- "keit." \skip 1 A \skip 1 "men." }
    \new Staff <<
      \clef bass \global
      \new Voice { \voiceOne c'2 d'2 d'2 e'2 \bar "|" a1 a1 \bar "|" g1( c'1) \bar "|" c'1( a1) \bar "|" c'2( b!4 a4 b1) \bar "||"  }
      \new Voice { \voiceTwo a2 g2 g2 e2 \bar "|" d1 a,1 \bar "|" e1( f1) \bar "|" c1( d1) \bar "|" g,\breve \bar "||"  }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
